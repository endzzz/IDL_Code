Pro classifyy
e = ENVI()
os = Python.import('os')
Model = ENVITensorFlowModel('E:\Deep_frustrating\classifier.h5')

flist = os.listdir('E:\masked_pansharpening_results')
for f =0, python.len(flist)-1 do begin
  if flist[f].endswith('masked') then begin
    fname = python.str('E:\masked_pansharpening_results\'+python.str(flist[f]+'.hdr'))
    print, fname
    Output_fname = python.str('E:\Deep_frustrating\Results\'+python.str(flist[f])+'classified')
    Raster = enviDeepLearningRaster(fname)
  ; Classify a different attribute image
; Get the task from the catalog of ENVITasks
    Task = ENVITask('TensorFlowMaskClassification')
 
; Define inputs
    Task.INPUT_RASTER = Raster
    Task.INPUT_MODEL = Model
    Task.OUTPUT_CLASSIFICATION_RASTER_URI = Output_fname
    Task.Execute

  endif
endfor
print,'done'
End