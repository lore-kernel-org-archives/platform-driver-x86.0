Received: from ganymed.uberspace.de (ganymed.uberspace.de [185.26.156.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 999BA6280B
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 22:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707864153; cv=none; b=VXcjpuMffizrjG2F9zk6Rdw6KLumIvU56N9qZOeSCnHgRtCcSjJREjdJJ2JjM/aJJD2erBTuVe/Y5t9o6bPNS87cHFqen1iGOVYhcL8s1SDwnhHX9wvu+HjsCybeuHG6TtPMVUGMf+W/Sx0XfE6MVbi7p4xpFDASGvMmJwdb80E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707864153; c=relaxed/simple;
	bh=elcd4TcDBr3qpgWDWtdDgTpj1evYS2cvT4Xz7wbMVVI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=CAlHxTGkdOJXESym2vlWbSqScu0/jr1cdBvWWdxE5/u8IMPSadRs2WaysqsJoH/idQqiRnkIpIJdyQDKk/g3iIien7D4wan8DP0Q/DR0B6egBJ4ItE5A9CU8yHkLzlvy4hSyCnS42SgMyjmjkr9KPZsRjwIymfYfc9HtXwlWJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de; spf=pass smtp.mailfrom=a-kobel.de; dkim=fail (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b=Y2ww5W8h reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b="Y2ww5W8h"
Received: (qmail 25836 invoked by uid 989); 13 Feb 2024 22:35:47 -0000
Authentication-Results: ganymed.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by ganymed.uberspace.de (Haraka/3.0.1) with ESMTPSA; Tue, 13 Feb 2024 23:35:47 +0100
Message-ID: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
Date: Tue, 13 Feb 2024 23:35:46 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexander Kobel <a-kobel@a-kobel.de>
Subject: platform/x86: intel-vbtn: 14c200b7ca46 breaks suspend on Thinkpad X1
 Tablet Gen2
To: Hans de Goede <hdegoede@redhat.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.172315) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.262315
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=a-kobel.de; s=uberspace;
	h=from;
	bh=elcd4TcDBr3qpgWDWtdDgTpj1evYS2cvT4Xz7wbMVVI=;
	b=Y2ww5W8hnYHo7PuyRw/1IChiDUjQMbXtq5CJNRMPAa7VjQwoqDPdFIm/PEJ2a+aWzDGmUnw7zl
	1UVBJRwA65ILwAGK0QPrb7tOpGvgFIaUBOkqXr3IbDT8XewogdYqOJqZ94dfX6uh/7sEa0+shh8V
	XMcufFL52J2nY5hO7IBXbmoX9i+8HAvbwejwoOs7RMHYRWh0HaVnbgAcauR95N21hR5/55jQON7p
	jAjanM2Mm/q//pEkUInTxULTdBuNv3wDijURlTiow4BoPAy3YefLTucBtxbNe1Vkk1bMLlzZzJRW
	2NziS3n+NMXaiyfY1yYyl/b52ZhjYYXupjY6gZ+KYl2vxFqeS9BYkEyuiKYspw4E5iVR/a4LJ+aD
	+WfZws7Wlj0QXaBhGlSB8/PWh62q4CqXxMGHoT4rVHx1ZU315Px2PSphSQcE9XwlMUQ3h6ofqWze
	LfhfLnbadJsxtF76d6pOdaVR5k49sCa3pQWxnEo8UVevxddd2cAlYNIowRUTOUfhx33+hp0yLSGk
	2coi/nQccMmnI0IIpFOt9YcGkUXAXmzfbYfA4sBr6TsybA1UG5UPCdbLT+CMAo2LLbD72c2sulos
	cxV8VFgjTk4xjICqQ4Mck5Nxfvcgs+HwE0wHPqzUl/UYGF1lDcV0Bhp1I5mOqsJV8yhLKYma/Cgp
	A=

Hi Hans, all,

after upgrading to 6.7.1 or 6.6.13 (LTS), my Thinkpad X1 Tablet doesn't suspend anymore. Or, rather, it suspends, but wakes again immediately. This happens regardless of whether the keyboard is attached or not, with all ACPI wakeup triggers disabled according to /proc/acpi/wakeup.
I could identify the following commit as the culprit:

	14c200b7ca46b9a9f4af9e81d258a58274320b6f
	platform/x86: intel-vbtn: Fix missing tablet-mode-switch events

First, it's a suspiciously related patch going into both kernel versions.
Second, unloading intel-vbtn resolves the problem; machine suspends as usual.
Third, I tried modifying the patch. Commenting out the newly introduced

	/* Some devices need this to report further events */
	acpi_evaluate_object(handle, "VBDL", NULL, NULL);

resolves the problem on my machine.

I understand that the change was in for a reason, but the deeper meaning of that statement eludes me; is it possible that my model is quirky for that one?

FWIW:
- SW_TABLET_MODE is properly updated about half a second after I attach/detach/fold the keyboard during suspend with that statement commented out (but attaching/detaching/folding all wake the device, unless I also `echo Y > /sys/module/acpi/parameters/ec_no_wakeup` - but then I can't wake the tablet at all anymore).
- Folding the keyboard to the back of the device disables the keyboard.
  With that statement in (as in 6.7.1 upstream), SW_TABLET_MODE is set to 1 (correct), but reverts to 0 again after about a second (incorrect); the keyboard remains disabled.
  Without the statement, SW_TABLET_MODE remains on 1 until I flip back the keyboard to normal (expected behavior).


On a side note, I initially thought that detect_tablet_mode() in resume() is the culprit. intel_vbtn_pm_resume() is also included in the thaw callback (and I usually use hybrid suspend) and, after the patch, augmented with the detect_tablet_mode() routine.
If I understand correctly the description in [1], thaw is not really resume-/restore-like except perhaps for the corner case of failed hibernation image creation. Turns out it doesn't seem to cause the harm, but still: is intel_vbtn_pm_resume() on thaw really intended? The description says it's used to undo the changes made by the preceding freeze (including prepare), but this rather seems to match intel_vbtn_pm_complete()'s definition than intel_vbtn_pm_resume()'s... 

[1] https://www.kernel.org/doc/html/v4.12/driver-api/pm/types.html


Of course, I stand available for any debugging or further investigations; happy to do some work myself if someone can guide me through.


Cheers,
Alex
