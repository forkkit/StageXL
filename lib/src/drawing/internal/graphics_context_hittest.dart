part of stagexl.drawing;

class _GraphicsContextHitTest extends _GraphicsContextBase {
  bool _hit = false;
  final double _localX;
  final double _localY;

  _GraphicsContextHitTest(num localX, num localY)
      : _localX = localX.toDouble(),
        _localY = localY.toDouble();

  bool get hit => _hit;

  //---------------------------------------------------------------------------

  @override
  void fillColor(int color) {
    _GraphicsMesh mesh = _path;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void fillGradient(GraphicsGradient gradient) {
    _GraphicsMesh mesh = _path;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void fillPattern(GraphicsPattern pattern) {
    _GraphicsMesh mesh = _path;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void strokeColor(
      int color, double width, JointStyle jointStyle, CapsStyle capsStyle) {
    _GraphicsMesh mesh = _GraphicsStroke(_path, width, jointStyle, capsStyle);
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void strokeGradient(GraphicsGradient gradient, double width,
      JointStyle jointStyle, CapsStyle capsStyle) {
    _GraphicsMesh mesh = _GraphicsStroke(_path, width, jointStyle, capsStyle);
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void strokePattern(GraphicsPattern pattern, double width,
      JointStyle jointStyle, CapsStyle capsStyle) {
    _GraphicsMesh mesh = _GraphicsStroke(_path, width, jointStyle, capsStyle);
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void meshColor(_GraphicsCommandMeshColor command) {
    var mesh = command.mesh;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void meshGradient(_GraphicsCommandMeshGradient command) {
    var mesh = command.mesh;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }

  @override
  void meshPattern(_GraphicsCommandMeshPattern command) {
    var mesh = command.mesh;
    _hit = _hit || mesh.hitTest(_localX, _localY);
  }
}
