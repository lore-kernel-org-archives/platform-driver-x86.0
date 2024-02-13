Received: from ganymed.uberspace.de (ganymed.uberspace.de [185.26.156.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B92562810
	for <platform-driver-x86@vger.kernel.org>; Tue, 13 Feb 2024 23:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707868158; cv=none; b=ft1AtKhPhX68TAZGCwl7TQl2+dAdJecu7XvfKZbjQzTcGqAObi/EgFnSX8GU8eIzzs5kPEYdjx8EHB51cNtwnuZOltQk6OczIu7DnLmMFs2nFrz47UjUh0pJREoArlz4MYz3rRUghVEiVUdn4wHhPGhzLgvFiNv2E/e+hKIk+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707868158; c=relaxed/simple;
	bh=K6qmSw/olMZIPUUWCDdxnt2hrXt4WqbeyUuSw2Lmx58=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=EpPmCh4JHKad7zce4KJ0kG4sgfwaAcdBrm6Ft4CFNk0VFdIgEGYkAJSylXgwXGF+6qGvGDxXPTjiPuQW1GjgW0P6f97GNc3DFEumVC5YKeFdLdl9dGsfaZH0rm1TFdSh+Xcqek5+9WYTCDh5D8bCZ8/beuVzVPre6RK/1ncKFmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de; spf=pass smtp.mailfrom=a-kobel.de; dkim=fail (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b=MKoIjxRE reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b="MKoIjxRE"
Received: (qmail 16220 invoked by uid 989); 13 Feb 2024 23:49:11 -0000
Authentication-Results: ganymed.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by ganymed.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 14 Feb 2024 00:49:11 +0100
Message-ID: <9dfc79ce-faea-4c55-a3cd-17bb8d8efa54@a-kobel.de>
Date: Wed, 14 Feb 2024 00:49:11 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Alexander Kobel <a-kobel@a-kobel.de>
Subject: Re: platform/x86: intel-vbtn: 14c200b7ca46 breaks suspend on Thinkpad
 X1 Tablet Gen2
To: Hans de Goede <hdegoede@redhat.com>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
Content-Language: en-US
In-Reply-To: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: --
X-Rspamd-Report: BAYES_HAM(-2.379904) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -2.469904
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=a-kobel.de; s=uberspace;
	h=from;
	bh=K6qmSw/olMZIPUUWCDdxnt2hrXt4WqbeyUuSw2Lmx58=;
	b=MKoIjxREtyiNq0KIDsbyZ5eqZ3BVjmzuTDBsTao7LclkyeiQUdO/xt+uwbQ2si44byfT661FrH
	VzIQKjnCOMoh+tsOzbDBv1SlfdQRzOR8TUHY5S61pNKdEakqGvUqJm9hDNMD5bX70amlHf8LHKKq
	wHwVEelrrl2snd6sFN6Gkt8AvHwIBOMVAgnyjeG1RmC+2gQ3ni4uyyokZXdfUXSsvdkNeOPhWC0z
	GeDKpPkVDBxHp8elgqQelygwQ8s3HHxp1gLbwWxXl2/5U0+YwyB/Bv5ifXBBJD2gZ4mk0NpldD0F
	ex9dqaTBG+DRWtjiShk+CI4T7rWW3DfbyFTxzUfT1AwRNarPxbV6mPrCBIkyVCj2TDgEHm/oCq4G
	cT8/RZQv6ygGp5oZseFHoVx5xXBtmlJmJyCWMPtW/9nFIWi2kPhOmD2koCKwPDz7vdTIPNMqKomt
	DGz4JNOUUkdZ+YXRogVZ6X4eWeGcZCzWncFs6NNf3xfKTMoa9YxvhJMbkLCUUiN0R/4iVCENG/zV
	qLDq1lV/n4UP2mUf5BXIaTPAb0m/IAWD5D3emyw5cAL4c6DYaVmJlsXgiQILX21CcSaSwxfYFPKv
	Pwcv/72goFhW/2/1cxliZpUL78sAkKlSCSHCudp5lwGUPQ5EWuEYIdmPaitCkZwxw/d7RTWLCqlw
	E=

P.S.: I completely failed to find any explanation/definition of "VBDL" or "VGBS".  If someone could point me to that, I might be able to experiment more on my own.

If I understand correctly, the purpose of acpi_evaluate_object(handle, "VBDL", NULL, NULL) is to evaluate the SW_TABLET_MODE state and to perform some kind of reset for devices that don't update the state otherwise after resume.  Calling detect_table_mode() instead seems to satisfy at least the first purpose, and remedies the problem for me - but I guess that's not a full solution?


Cheers,
Alex


On 13/02/2024 23.35, Alexander Kobel wrote:
> Hi Hans, all,
> 
> after upgrading to 6.7.1 or 6.6.13 (LTS), my Thinkpad X1 Tablet doesn't suspend anymore. Or, rather, it suspends, but wakes again immediately. This happens regardless of whether the keyboard is attached or not, with all ACPI wakeup triggers disabled according to /proc/acpi/wakeup.
> I could identify the following commit as the culprit:
> 
> 	14c200b7ca46b9a9f4af9e81d258a58274320b6f
> 	platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
> 
> First, it's a suspiciously related patch going into both kernel versions.
> Second, unloading intel-vbtn resolves the problem; machine suspends as usual.
> Third, I tried modifying the patch. Commenting out the newly introduced
> 
> 	/* Some devices need this to report further events */
> 	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
> 
> resolves the problem on my machine.
> 
> I understand that the change was in for a reason, but the deeper meaning of that statement eludes me; is it possible that my model is quirky for that one?
> 
> FWIW:
> - SW_TABLET_MODE is properly updated about half a second after I attach/detach/fold the keyboard during suspend with that statement commented out (but attaching/detaching/folding all wake the device, unless I also `echo Y > /sys/module/acpi/parameters/ec_no_wakeup` - but then I can't wake the tablet at all anymore).
> - Folding the keyboard to the back of the device disables the keyboard.
>   With that statement in (as in 6.7.1 upstream), SW_TABLET_MODE is set to 1 (correct), but reverts to 0 again after about a second (incorrect); the keyboard remains disabled.
>   Without the statement, SW_TABLET_MODE remains on 1 until I flip back the keyboard to normal (expected behavior).
> 
> 
> On a side note, I initially thought that detect_tablet_mode() in resume() is the culprit. intel_vbtn_pm_resume() is also included in the thaw callback (and I usually use hybrid suspend) and, after the patch, augmented with the detect_tablet_mode() routine.
> If I understand correctly the description in [1], thaw is not really resume-/restore-like except perhaps for the corner case of failed hibernation image creation. Turns out it doesn't seem to cause the harm, but still: is intel_vbtn_pm_resume() on thaw really intended? The description says it's used to undo the changes made by the preceding freeze (including prepare), but this rather seems to match intel_vbtn_pm_complete()'s definition than intel_vbtn_pm_resume()'s... 
> 
> [1] https://www.kernel.org/doc/html/v4.12/driver-api/pm/types.html
> 
> 
> Of course, I stand available for any debugging or further investigations; happy to do some work myself if someone can guide me through.
> 
> 
> Cheers,
> Alex
