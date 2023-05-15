function lst = getCurrentPose()
arb = Arbotix('port', 'COM5', 'nservos', 5);
lst = arb.getpos();
lst = lst(1,1:4);
end