Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D4213D531
	for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 21:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742936680; cv=none; b=Dkc3aMlYIhv/o3SBHH3VSgqeQ6tIKJ09nNLDLn2AATW+oCBxbm8/IRfNJI3yjZI98YXTOv0np4qirQUdUM5w/3016KWcmxrRh622U8+2Ym/8a3EisNgZ8MR2meEZghIoKeOWLjDa1LV/uyWWmshqmbW7hHGSdwBM32vorHVtLBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742936680; c=relaxed/simple;
	bh=keVbsTJOF7ubghM5ZrvsBugE9BhrTlLWC4ZPcSXIE5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=hBS8fO8sAASxdJaYoTeXq5NXVKfEXgnXNYJ58SRNWQD/exFOA2qK3m9drqC48BS+U1vP44UzvDth16jYcYeGPxwem3nrJbBxPsZ8ptq31n1jHGqo+b6+sobcm2oMPLbHfs1OP1eQKy+knhBm6pB9O18k8sU7U210BtS5FrAs4FY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RXKKTyS5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RXKKTyS5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742936677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YX9+5TJa3aFyECisjUvQJ9pK06+jOiiefk/aSBjisBs=;
	b=RXKKTyS5rGVgRUCO8eq7aq0ApcgrEgCELzJlGhtBb1UtfnBONrpAs1ehj50JvxjMbOT/RW
	u5irtrPCBjAiR8Yf+f0UVczbO2K512gKUcOrUq9SNguRXJM+dH+0TjPTgytIzMoscihtae
	HIquAyZU2VIYC4S54trsIGLEtfY8/4s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-613-ewkREAUyN92Ql8XGAvsLmw-1; Tue, 25 Mar 2025 17:04:27 -0400
X-MC-Unique: ewkREAUyN92Ql8XGAvsLmw-1
X-Mimecast-MFC-AGG-ID: ewkREAUyN92Ql8XGAvsLmw_1742936665
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac25852291cso534039166b.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Mar 2025 14:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742936665; x=1743541465;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YX9+5TJa3aFyECisjUvQJ9pK06+jOiiefk/aSBjisBs=;
        b=NGc6E3cn2/WhS6CaqBfqBBoMuQnIf1xXOldif36huUqtblWQCupcJbw7ZHIWzuX+cg
         glk2pAYVL85rqmeTm3w0NxHwrnmrLIz9JqwVvVWcIjH/4Mjbp2D7dIpmzhcYTmACaA77
         Pc7tV/wrwfp7ELpJI6x4CvGFtvjsNGqZXzxNRKFMgokiInDamTiAdr4x2gOAhELma2TR
         RgnTlXJYqycjDq3rd1HYHlU7xzK+OyjljlW7BcKPfb3k/A24CwGkprCS21dq605aiWe+
         wpVfE5SjiUQw+NaTE6PwkefnOwwkZNCAn+8JuocFejNQkivJdCctLNR4b9w7HMuQ7xmA
         4o+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtgxiMMX5OxShsrR0jNayHEGWoqpOF07bStCiyphsglTm4ctPVjHkjQjVUKS2lq0kIa5Tpr82kjPcuchrJkN2d+TUz@vger.kernel.org
X-Gm-Message-State: AOJu0Yy11YnMTIUnYkYQUqNYsVbBuM8u3zsZUfksL0dArT95XAEQpqDl
	KcwdHbpmFIS2vI+xYvCtjOjldCTB+xmULF7SqceoHUk1np1uTAoFKGy3iN+TBDgKovPqB3dUATU
	NycSHO2eLMss3ysVPkLbryKSD/hI0K2VmD/poCy0p9yiWElWcRsvXlr+e5zZC8gYcIVw+8Po=
X-Gm-Gg: ASbGncvN55BWoLmUom8uCkaLw7p9vp4bFtlUkkA/t2JLV9sDk0dn0xtWTbcBtzfsGVm
	khc1N0Xox6WQSFhzorE9Ylxv3lMK7gDfyz0cqEum72T54cvq/LyttV35eUeC110DvO/u281uFtU
	e84HGEu14wPwJsHNkkLvDg0jvJ73FzosycaUz9zKxKBG6unjVdmCarIHRntfwfqg6KQcR46pz6j
	SMHyf0mpymyQJ6795pdHaW0PDGAmFROPxOaZxdWyMI5AQxCkW8Ebthe6pBLGfKyqvFu7B47pgvQ
	ogl5OFxJhHL+NB4l50e6XKddCRQ/oflak/1xPuuLSar4t59Lqgdt3CvL3543Wp0pW+fpXzKz/fZ
	O6dBNSsqXBhDeH+Xjx+jWSHyepBhSBOa8z8gIzsE6k0dmtJ01sBX9b/v0ZYYF2bjWZw==
X-Received: by 2002:a17:907:3da8:b0:ac6:dd50:9b4a with SMTP id a640c23a62f3a-ac6dd50aebcmr167139266b.36.1742936664985;
        Tue, 25 Mar 2025 14:04:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkV+xIkJby2CElAH30eWhtOutYugGc6B3bmd260qi9iCx5X6ruUwc9hNTizU6OPfevb4c/TA==
X-Received: by 2002:a17:907:3da8:b0:ac6:dd50:9b4a with SMTP id a640c23a62f3a-ac6dd50aebcmr167136066b.36.1742936664498;
        Tue, 25 Mar 2025 14:04:24 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efd47e9dsm898606166b.167.2025.03.25.14.04.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 14:04:23 -0700 (PDT)
Message-ID: <4acb0029-9e94-48ab-be62-206ae22e4ad5@redhat.com>
Date: Tue, 25 Mar 2025 22:04:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: x86_android_tablets kernel module fails to load on Lenovo
 Yogatab3 YT3-90L
To: Agoston Lorincz <pipacsba@gmail.com>, platform-driver-x86@vger.kernel.org
References: <CAMEzqD+DNXrAvUOHviB2O2bjtcbmo3xH=kunKr4nubuMLbb_0A@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAMEzqD+DNXrAvUOHviB2O2bjtcbmo3xH=kunKr4nubuMLbb_0A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Ágoston,

On 18-Mar-25 2:13 PM, Agoston Lorincz wrote:
> Hello!
> 
> I face the following problem: x86_android_tablets kernel module fails
> to load on Lenovo Yogatab3 YT3-90L
>> [   17.853705] x86_android_tablets: error -16 getting GPIO INT33FF:01 5
>> [   17.859623] x86_android_tablets x86_android_tablets: probe with driver
>> x86_android_tablets failed with error -16
> Steps to Reproduce:  compile and boot into kernel 6.14-rc5 (from
> tarball) Lenovo Yogatab3 YT3-90L. Ubuntu 24.04 is used as an
> environment. Kernel is compiled on target.
> 
> Actual Results: e.g. the batteries are not recognized
> 
> Build Date & Hardware:
>   OS: Ubuntu 24.04.2 LTS x86_64
>   Host: CHERRYVIEW D1 PLATFORM Blade3-10A-001
>   Kernel: 6.14.0-rc5
> 
> Additional Builds and Platforms: last checked working using kernel
> 6.6.30 (I have not tried on later 6.6.x  kernels, but already not
> working - same results- on 6.7.10) - here the Ubuntu mainline compiles
> were used and installed from .deb files.
> 
> Additional Information: some additional logs on
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2062120

First of all cool to hear that someone is actually using my work to
make Linux work on X86 tablets which shipped with Android as factory
OS. Dealing with all the brokenness of the ACPI tables on these
devices has become a bit of a hobby of mine, so I'm glad to see this
is actually being used by others.

About your problem, at first I could not reproduce this, but after
looking at the ACPI tables I've managed to come up with a reproducer
and a fix. I'll send out the fix right after this email (with you
in the Cc), adding that on top of e.g. 6.14.0 should fix things.

The root cause is that depending on the secureboot signature on
EFI\BOOT\BOOTX86.EFI the Lenovo Yoga Tab 3 UEFI will switch its
OSID ACPI variable between 1 (Windows) and 4 (Android(GMIN))
and the problem you are hitting happens with OSID == 1.

I've always replaced /boot/efi/EFI/BOOT/BOOTX86.EFI with
the original Android OS loader.efi because I dual-boot with
the original Android OS and that needs OSID=4 to work.

I assume that Ubuntu, like Fedora installs the secureboot
shim used to allow booting on Windows machines with secureboot
enabled as EFI\BOOT\BOOTX86.EFI, which will trigger the EFI-
firmware on the yt3-x90 to set OSID=1 causing the issue you
are seeing. Replacing /boot/efi/EFI/BOOT/BOOTX86.EFI with
shimx64.efi reproduces your issue for me.

Regards,

Hans


