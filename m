Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441451865C
	for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 10:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707908077; cv=none; b=KjrH3RlL75ixb7agWSLdxAemfXs3dxtLEBGIylFVx/jX7q8RuZNMccDAXO2D94geEbqLq8FZjmXNNuuMyea7lLzy8zRdYi0MhWdD9FCmPRU2lprc9bottRkZrlMAJZyiri5VzkiYakJ4q1Cx8Bg5tj8OgbTGsqGru6jNWsymqMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707908077; c=relaxed/simple;
	bh=7RgKy7tLZWPEFtn0O+noq9FiG+fmrCaZeOprkpYC+7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KO5JaxzYhoITAc7Ir1Cnp625LZSBnh8SDPX3Y/4EaXMvP3xUTqWhlWXw1jLQFatVpjzvjVuGTjjCJY/u3sVAyDCFJI3rLBju5Z717wxkIfr5lCEn/IEtIkWdeCMCF1voy56glHsguT+T/mcz5zkyYaoK3uDsB3up7+C8kbC5vL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H48H6NCD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H48H6NCD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707908075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XSgWpzGLcseGzbRcJVKSVJLW5v3xUs7OVNwOIrbCVY0=;
	b=H48H6NCDyHfYjWfhDvkEfXDmi06BFQ+wO3dEELNPMvB/AmGGgJ19KSEnLXL7RaXHYtS+00
	L585f0zPQJpLnka+IseGaiVuk3shv6WtJTQwDkmJCe7jkTxFG1Pmh1GcTrNkRdPSXWYbyw
	FBqgjJAvWPy/gCV0D0Y6ZhtnEbucXV0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-61vY59NeNKO61wgf36yexQ-1; Wed, 14 Feb 2024 05:54:33 -0500
X-MC-Unique: 61vY59NeNKO61wgf36yexQ-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a3d4cfc543fso23454366b.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 14 Feb 2024 02:54:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707908072; x=1708512872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XSgWpzGLcseGzbRcJVKSVJLW5v3xUs7OVNwOIrbCVY0=;
        b=m93a+/qwJGMz1I0T6jAxBUTadGoVhm5OvJPnIXqAAMloDD+XKBqMCZ61no6G76S2Go
         CTnEVXe2eTZdENlwxFLk/x5KtIf9KqVNWCAdA9NrUOyn03aqsfrYC8cPY7azsf5H5IeM
         i4OAFDZuPuFsijiVHKZxwYasQ1YX6GaQvAfSNDI8nv/BX/XGSScEgzA1ybz7Ec4FPB8F
         9WvQ/c4FBuDKbt3OjCR5DjrPGmTsfX9Z6IPYwH9C4SNU49ozhJsPRBmX590xnWuDs3OB
         4341eigNvy/h9i9M9N/cuO1ZA96sXBhusCj5wzMql9Ma/lziry5S3MQE9nRTMb7M7rmq
         mcSw==
X-Gm-Message-State: AOJu0Ywd4aoMBe+CcjoSAhb6VKHHUKLIqR3rQWZHBVpYtQb2ZoQlHb+n
	qVvASs51ol/LhoOsnxU2Xi8iqUWF/vnDOxubXydc//sfpMbQ05F/19nIwyxIIUGM6rOqUFgplU8
	5yJ7o99fE0ROFJXBPDWdpi+0x0b7CazF8Os0jd0kC2ssXDGrv8UMO7mmfRbUuwLdFC04za07OYW
	IQ4C0=
X-Received: by 2002:a17:906:adca:b0:a37:78f1:12f6 with SMTP id lb10-20020a170906adca00b00a3778f112f6mr1325889ejb.67.1707908072113;
        Wed, 14 Feb 2024 02:54:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdGRslnvf6HWFrCpyz6aKcoXSBp+FyVExfxyRCCBF+QyfVB5ou2TvKOmyPUnOwTAlThLgHLw==
X-Received: by 2002:a17:906:adca:b0:a37:78f1:12f6 with SMTP id lb10-20020a170906adca00b00a3778f112f6mr1325875ejb.67.1707908071726;
        Wed, 14 Feb 2024 02:54:31 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id j14-20020a170906254e00b00a3cbbaf5981sm2195205ejb.51.2024.02.14.02.54.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Feb 2024 02:54:31 -0800 (PST)
Message-ID: <1b1f482d-6951-4b66-b510-7419f719114c@redhat.com>
Date: Wed, 14 Feb 2024 11:54:30 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: platform/x86: intel-vbtn: 14c200b7ca46 breaks suspend on Thinkpad
 X1 Tablet Gen2
Content-Language: en-US, nl
To: Alexander Kobel <a-kobel@a-kobel.de>
Cc: "platform-driver-x86@vger.kernel.org"
 <platform-driver-x86@vger.kernel.org>
References: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <295984ce-bd4b-49bd-adc5-ffe7c898d7f0@a-kobel.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Alexander,

On 2/13/24 23:35, Alexander Kobel wrote:
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

Thank you for reporting this and sorry about the regression.

Also great that you've already pinpointed which exact patch
and which part of the patch is causing this problem.

> I understand that the change was in for a reason, but the deeper meaning of that statement eludes me; is it possible that my model is quirky for that one?
> FWIW:
> - SW_TABLET_MODE is properly updated about half a second after I attach/detach/fold the keyboard during suspend with that statement commented out

Which input device is generating "SW_TABLET_MODE" events ? Are these
coming from a "Intel Virtual Switches" input device, or are these
generated by some other input device ?

And I assume that you also have an "Intel Virtual Buttons"
input device ?

> (but attaching/detaching/folding all wake the device, unless I also `echo Y > /sys/module/acpi/parameters/ec_no_wakeup` - but then I can't wake the tablet at all anymore).

I assume that this changing the mode wakes up the 2-in-1 is a pre-existing
problem which also happens with older kernels ?

> - Folding the keyboard to the back of the device disables the keyboard.
>   With that statement in (as in 6.7.1 upstream), SW_TABLET_MODE is set to 1 (correct), but reverts to 0 again after about a second (incorrect); the keyboard remains disabled.
>   Without the statement, SW_TABLET_MODE remains on 1 until I flip back the keyboard to normal (expected behavior).

Just to make sure that I understand things correctly, commenting out the new:

 	/* Some devices need this to report further events */
 	acpi_evaluate_object(handle, "VBDL", NULL, NULL);

Call not only fixes suspend/resume mode but also fixes SW_TABLET_MODE
reverting to 0 after about 1 second while it should stay 1 ?

I guess this also answers my question from above if SW_TABLET_MODE
is reported by a "Intel Virtual Switches" device and the answer
to that would be yes, right ?

I have the feeling that we are just going to need to revert
the addition of this call then IOW your solution of commenting
it out is the right solution.

> P.S.: I completely failed to find any explanation/definition of "VBDL" or "VGBS".  If someone could
> point me to that, I might be able to experiment more on my own.

The Intel VBTN interface is not documented anywhere AFAIK, so
the below is based on my understanding of things:

"VBDL" is a method called to let the firmware know that the OS
has a vbtn driver and that it can start delivering events.
I have the feeling that on your X1 Tablet Gen2 it works as
a sort of init() function and it probably causes at least
1 event (current tablet-mode event?) to be reported which
is causing the wakeup /me thinks.

"VGBS" is used to ask the firmware for the initial status
(tablet or laptop mode) on initialization. The driver also
uses the presence of the "VGBS" method to determine if
the device supports tablet-mode-sw reporting or not.

So the idea behind the patch causing your regression was
that maybe on some hw we need to call "VBDL" which enables
event reporting after every event to fix event reporting
sometimes stopping by re-enabling event reporting after
every event. This assumes that calling "VBDL" more then
once does not have any side effects, where in your case
it clearly seems to have several undesirable side-effects.

So again the fix probably is to simply just drop the
newly added "VBDL" call.

Regards,

Hans

