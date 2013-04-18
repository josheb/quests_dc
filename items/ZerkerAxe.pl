sub EVENT_SCALE_CALC {
	if ($class eq 'Berserker') {
		$questitem->SetScale(1.1);
	}
	else {
		$questitem->SetScale(1.0);
	}
}