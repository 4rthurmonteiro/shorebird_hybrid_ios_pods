import 'dart:io';

void main() async {
  const folder = '../../release/flutter_module';
  const version = '1.0.0+2';

  await Process.run(
    'mkdir',
    [
      folder,
    ],
  );

  await _genApp(version, folder);

  await Process.run(
    'cp',
    [
      '-r',
      '../../release/App.xcframework',
      '$folder/App.xcframework',
    ],
  );

  await Process.run(
    'tar',
    [
      '-czvf',
      'flutter_module.tar.gz',
      '.',
    ],
    workingDirectory: '$folder/',
  );
}

Future<void> _genApp(
  String version,
  String folder,
) async {
  final appPodspec = _getAppPodspec(
    version: version,
  );

  final appFile = await File('$folder/flutter_module.podspec').create(
    recursive: true,
  );

  await appFile.writeAsString(
    appPodspec,
  );
}

String _getAppPodspec({
  String version = '1.0.0',
}) =>
    '''
Pod::Spec.new do |spec|
  spec.name         = "flutter_module"
  spec.version      = "$version"
  spec.summary      = "Flutter module for WebMotors App PF"
  spec.description  = <<-DESC
    Flutter module for WebMotors App PF
                    DESC
  spec.homepage     = "https://bitbucket.org/webmotors/webmotors.posvenda.flutter"
  spec.license      = { :type => "MIT", :text => "Free" }
  spec.author       = { "Arthur Monteiro" => "consultorweb.arthur@webmotors.com.br" }
  spec.platform     = :ios, "12.0"
  spec.source       = { :http => "file://" + __dir__ + "/flutter_module.tar.gz" }
  spec.vendored_frameworks = 'App.xcframework'
  spec.requires_arc = true
  spec.static_framework = true
end
''';
