Received: from ganymed.uberspace.de (ganymed.uberspace.de [185.26.156.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C42831AAD4
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 12:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.26.156.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707912108; cv=none; b=VytcXhM9RBAels7M/UURBnyP1cHCcz2f0n2padVtBTOTa1wUFTZYm5UVYSiqVIfMrcml8nQk6XNYzwarLWk2j4wQbiz9oP21d8LkNeVQ4PStlvoeCstnx4//4HsPG/yNVs7g1ktxPo/dVjY/RT17iJtz40i+rcul91JD0sCdPw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707912108; c=relaxed/simple;
	bh=ml9Ane278qisLUO6VhuXmdwcLGXm/7NEVSbqfFR6qA4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=b7SVDMVzeX2A75yxNDQThKGZzm5EL66K+lDkAmhV75Z8Yf3g27zHU7CZSR5Ny1x3HCqB4fLR54ifIfhfl98YalqpI/oGPLxhS59eoNlDKhHyMMN6NFqKgfEAMwKk4rqyJcknRpJ9D154kA9ikTOzt2MIyvM1nypi86NQhlH98E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de; spf=pass smtp.mailfrom=a-kobel.de; dkim=fail (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b=IdC8rXg5 reason="key not found in DNS"; arc=none smtp.client-ip=185.26.156.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a-kobel.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=a-kobel.de header.i=@a-kobel.de header.b="IdC8rXg5"
Received: (qmail 14696 invoked by uid 989); 14 Feb 2024 12:01:42 -0000
Authentication-Results: ganymed.uberspace.de;
	auth=pass (plain)
Received: from unknown (HELO unkown) (::1)
	by ganymed.uberspace.de (Haraka/3.0.1) with ESMTPSA; Wed, 14 Feb 2024 13:01:42 +0100
Message-ID: <eb9eec8d-d302-4ab2-a0d7-2df06c9eef52@a-kobel.de>
Date: Wed, 14 Feb 2024 13:01:41 +0100
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
 <1b1f482d-6951-4b66-b510-7419f719114c@redhat.com>
Content-Language: en-US
In-Reply-To: <1b1f482d-6951-4b66-b510-7419f719114c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Bar: ---
X-Rspamd-Report: BAYES_HAM(-3) XM_UA_NO_VERSION(0.01) MIME_GOOD(-0.1)
X-Rspamd-Score: -3.09
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=a-kobel.de; s=uberspace;
	h=from;
	bh=ml9Ane278qisLUO6VhuXmdwcLGXm/7NEVSbqfFR6qA4=;
	b=IdC8rXg5Otwwd48osLhw9RMDu+R7akDL+UjwC1iYawe/4LQsR0UCtqv3aBcV4HGeFfAhIdmy+7
	9mtYgs79Sz+5eq5ouhQK68vuE3n5ILjHaPT0dfjpXfVQNxqfWbJylIyqV1s4lCEFQRosj1Eg7JGV
	rE5UDGmgrZuT6lD2yBy60/2TCuMeZwDLdBQcgOdolORVD1Ezlwn8pbMzmowMNOVUdZYOMlMNBYLe
	VzimX5Pefc2gCsnSaiGk/f3uzCDnXmPliaH3+iLl/a1XnIgXmZHc3SeRUzzEwVDl6w4sLVkFW+Vd
	QQSDVOTVmci/urgCh1u+2gQ9z9gHzhWCz6O1TBlyzqB0vsPPojFGwmnFA2FA/Y92HCSNJgvHCAfH
	qILPXuKviJhn7OFL736rjmlhPtCONI2HDIq2NaBUpUj3mCgCmovtV2rwrU07hapPCo/DRflCPvYx
	ALjjzrossSOuMkG5fps3mdCeo6Q+TmBhwmU8lcTUyteG2f4PLoEvT3dT1CPJeEyGY9z+h7VYpeu/
	Hpx1P2adSDwRVECgNFJ1u6abYYGKdYC8xWaPBMGNyYZanqGB7VedwryEt2xTqo+bMPWOTen4PzJZ
	7oZR0/yOpcZk89G+BajO6gU9KJ6/UWKjQsI5O9FSpWQCsl0WKzjFPCMUruUz07rDnU/sYc32UQrE
	U=

Hi Hans,

On 14/02/2024 11.54, Hans de Goede wrote:
> Hi Alexander,
> 
> On 2/13/24 23:35, Alexander Kobel wrote:
>> Hi Hans, all,
>>
>> after upgrading to 6.7.1 or 6.6.13 (LTS), my Thinkpad X1 Tablet doesn't suspend anymore. Or, rather, it suspends, but wakes again immediately. This happens regardless of whether the keyboard is attached or not, with all ACPI wakeup triggers disabled according to /proc/acpi/wakeup.
>> I could identify the following commit as the culprit:
>>
>> 	14c200b7ca46b9a9f4af9e81d258a58274320b6f
>> 	platform/x86: intel-vbtn: Fix missing tablet-mode-switch events
>>
>> First, it's a suspiciously related patch going into both kernel versions.
>> Second, unloading intel-vbtn resolves the problem; machine suspends as usual.
>> Third, I tried modifying the patch. Commenting out the newly introduced
>>
>> 	/* Some devices need this to report further events */
>> 	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
>>
>> resolves the problem on my machine.
> 
> Thank you for reporting this and sorry about the regression.
> 
> Also great that you've already pinpointed which exact patch
> and which part of the patch is causing this problem.

No worries, thanks for the swift reply.

>> I understand that the change was in for a reason, but the deeper meaning of that statement eludes me; is it possible that my model is quirky for that one?
>> FWIW:
>> - SW_TABLET_MODE is properly updated about half a second after I attach/detach/fold the keyboard during suspend with that statement commented out
> 
> Which input device is generating "SW_TABLET_MODE" events ? Are these
> coming from a "Intel Virtual Switches" input device, or are these
> generated by some other input device ?
> 
> And I assume that you also have an "Intel Virtual Buttons"
> input device ?

Correct:

% libinput list-devices | grep Intel
Device:           Intel Virtual Buttons
Device:           Intel Virtual Switches
Device:           Intel HID events
Device:           Intel HID 5 button array

>> (but attaching/detaching/folding all wake the device, unless I also `echo Y > /sys/module/acpi/parameters/ec_no_wakeup` - but then I can't wake the tablet at all anymore).
> 
> I assume that this changing the mode wakes up the 2-in-1 is a pre-existing
> problem which also happens with older kernels ?

Correct.

>> - Folding the keyboard to the back of the device disables the keyboard.
>>   With that statement in (as in 6.7.1 upstream), SW_TABLET_MODE is set to 1 (correct), but reverts to 0 again after about a second (incorrect); the keyboard remains disabled.
>>   Without the statement, SW_TABLET_MODE remains on 1 until I flip back the keyboard to normal (expected behavior).
> 
> Just to make sure that I understand things correctly, commenting out the new:
> 
>  	/* Some devices need this to report further events */
>  	acpi_evaluate_object(handle, "VBDL", NULL, NULL);
> 
> Call not only fixes suspend/resume mode but also fixes SW_TABLET_MODE
> reverting to 0 after about 1 second while it should stay 1 ?

Correct.
N.B.: It still triggers wakeup when I flip or detach the keyboard.  In order to prevent that, I have to both unload intel-vbtn entirely *and* disable the XHC wake-up trigger, if I didn't miss anything.

> I guess this also answers my question from above if SW_TABLET_MODE
> is reported by a "Intel Virtual Switches" device and the answer
> to that would be yes, right ?

Correct.

> I have the feeling that we are just going to need to revert
> the addition of this call then IOW your solution of commenting
> it out is the right solution.
> 
>> P.S.: I completely failed to find any explanation/definition of "VBDL" or "VGBS".  If someone could
>> point me to that, I might be able to experiment more on my own.
> 
> The Intel VBTN interface is not documented anywhere AFAIK, so
> the below is based on my understanding of things:
> 
> "VBDL" is a method called to let the firmware know that the OS
> has a vbtn driver and that it can start delivering events.
> I have the feeling that on your X1 Tablet Gen2 it works as
> a sort of init() function and it probably causes at least
> 1 event (current tablet-mode event?) to be reported which
> is causing the wakeup /me thinks.
> 
> "VGBS" is used to ask the firmware for the initial status
> (tablet or laptop mode) on initialization. The driver also
> uses the presence of the "VGBS" method to determine if
> the device supports tablet-mode-sw reporting or not.
> 
> So the idea behind the patch causing your regression was
> that maybe on some hw we need to call "VBDL" which enables
> event reporting after every event to fix event reporting
> sometimes stopping by re-enabling event reporting after
> every event. This assumes that calling "VBDL" more then
> once does not have any side effects, where in your case
> it clearly seems to have several undesirable side-effects.
> 
> So again the fix probably is to simply just drop the
> newly added "VBDL" call.

Thanks for taking the time for an explanation.  Sounds like *not* needing the VBDL call should be default, and that rather the devices that need it are quirky.  Although that doesn't mean that the X1 Tablet is fine, because the side effect of immediately resuming also seems rare; otherwise it'd have been spotted and reported earlier by others, I suppose.  And, apparently, calling VBDL makes the X1 Tablet misreport the tablet mode state.
Hm.  Perhaps introducing a special handling of the Inspiron 7352 would be the way to go then?

FWIW, I previously dumped a DSDT (for entirely unrelated reasons): https://raw.githubusercontent.com/akobel/linux-thinkpad-x1-tablet/main/x1-tablet-gen2/DSDT/dsl/dsdt.dsl
Just in case it's useful in further investigation/comparison to the Dell...
 

> Regards,
> 
> Hans

Cheers,
Alex
