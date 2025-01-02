Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF654C9A;
	Thu,  2 Jan 2025 15:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735833024; cv=none; b=o4Cf73xbcvA7OXXprqIxKpz9A/cqORtU2/WvCG3CPd4AG0HqC28UHzMJ22ibqJ8y50MGclYEL+8bSrkSALSQQ0eTiXUuequNYp80rqsemqgnGyk0tflnSqMqi8bJ/ZpJtN9nfjXT3kBFkt036+iubkyRk/pHnbp8itev4Q1oydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735833024; c=relaxed/simple;
	bh=JlTc5/gVqoG55ymnoQco47jPrFElQ5gI67BkKA9EZXk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcB16X5d2eyJt5upwtoRKTsbThfGqNXiUuiDpTW8HGoFBTzE67VtOboU0ejhmI7GeqQkLofQ6ESxKwe2EvnO+6lnY/c/F/iCsTlgIhg6jzqsIBOgM62qqLUlSFxlPEyymMSg2OGYlHVOQpLtOF4Z9Z40gx5JWZ02G0oAxDBN5tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=ULUZ+LtH; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="ULUZ+LtH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735833010; x=1736437810; i=w_armin@gmx.de;
	bh=saa/IhzvQllZqmov8xMsEd3cc9hnub17le/mSfTRqgI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ULUZ+LtHWyR+fxLMCwDDUkWE1MbGkD/HI4PmheudbwJjry+o8PCT0UUmYg2e2QPY
	 VY1zHbI2lKewKXGU2ux2WqkxFXUCgdtk0a3p9vzv+44G8N+e2Y5N5WdeJmp0+4vt4
	 u0DSqmo1LJKx/KoVEGtMns7dHEbHrikrwlEtXRhP2XU77GKyJ72LubQpHdByCWOO6
	 kmZI5R5UPwbhKoRVcPr8imF2yaZZnf+aWV3x14zUqejuf72s0mfMIyvtwItP5CDy4
	 M0AQOdkc8w2t0H5+iB0if1u0UnxWAdef4+DJDzUEtcJ7ls8elBXdtbv9OQhVl6C4U
	 HBseBii9r3QWkxFUYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mj8qd-1txBpf15y1-00fRHi; Thu, 02
 Jan 2025 16:50:10 +0100
Message-ID: <e5618537-a7ad-42e2-99d8-178ebc59192b@gmx.de>
Date: Thu, 2 Jan 2025 16:50:05 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 00/20] alienware-wmi driver rework
To: Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org
Cc: Dell.Client.Kernel@dell.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-kernel@vger.kernel.org,
 mario.limonciello@amd.com
References: <20241229194506.8268-2-kuurtb@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241229194506.8268-2-kuurtb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:zKKJ/sTz+2OYgSLcqGpfuYmQXAHX7klgfhhtfNJeAvOKYhviqlD
 61RLqs6nC0OfSY+GVVp8HwLcsw7DgASIttm88pMjTf9VShTYPxox6S0ymY4ndHmkLdvvKee
 ZIPBt9gjQVrHuiN/Nnz09P7g7/FnmO6rtxEaE/a8YhG7g9sRubHpkesTCEyxmRPBQP4yxoP
 fzRlTDtup8KGjWpe+XC8A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Wg5ZwRIAOak=;JneV+QrF3g7zCjFoFiCO3DD6kHr
 tpLpfVy0/9qTU4kxOT7ET6kcOnI0IfvS3Ozh6fvRC6gSsLVfmJzdFava0aAPHQFUdPx/gIa8s
 QsbCeMJEEaY0juYzVaSX1enC/Sbv22eGDOWCQ9YFJg11jcgYWcwKRH7jX0SKHZONTKBSYozPu
 66Fb+0sk8qsbbtpQCDu1I5gep9ln1QpIvVNJ3DyTx/N19orFGutq/GE3L0WDScPGVjpXXBstB
 cHQWcHHU0AsVCDkg8StIAdOq1EE9IXqGSN80vWghLM5wVE8c9rG5aOSQBTGqHc71I7uHI2mRz
 KSxEg/b3Wlhh9UzCHh1uPxzanxHf52TpaB3Ip0SaqkFVFT2TdTN9ufgibxGSfbPbftAafO5qt
 f4vNOu3W7sM0T4Y9dzqO+fubqKj7xcJWtmxApDsL2y79UneDOx9BybY1UE3B5V9p2BNd5qzBY
 NWl4jkjfycQSNKmazUqQghpo4Le2Xo+VqCIwtvdp/k1jX02jApR2J8wIOHBi6j8X+w5Y4b+OS
 /mSOYOo5G455Ta8oeVUUlOA7I4zhDJwyuFYuqTnMZtGsnzlvn0bgT8GpTpzgerlEi7KP2emtn
 kUY9zyyfttGCnUGZrqWqtZPoQ669k1Jz98fhgBhrSq7i0abemGbdmGx/x0DsSg9F1I6zXhgY+
 1SVBl1sQd1VrdG3IgiOloEQPEXuYYb1w8zpMGYaPHZi3O4NbuHmcozAfbqVx4+h7wsULYKfys
 v45pWECrJly+AzuOIBuT1b8pjtvz32Zdc1zsczviDDLDhkstUhxUxkxlzR/uc3WUEMZLe25te
 b/J3rfXdD/RdHRM5OtWgrxYGaLm/gn/TqY8oRrOyYcz/CiHbDcAKGGexvQJj5YPdnIPrjQYyB
 PN5ixTflEYw88O0CwUO90cSOFA6xDoP/bT5WavkqktA4diuuPF3XmWZrYL91KysjM02jnKmbv
 AHcy4rtJ0aRx7y9AJplfOdxwI8a9qSKKaNUKwUPBqakgHW3iIQFLV5LiaDMOO927jGDva5ZI4
 QiExKFU7GeOnkZEDB6Ilj3muVxAseudPprz05KTkGcLTCXyB2z7QRij4vdyrMb0or2Xh7s7a9
 iyxJCHUn01bW7B6sv8A5IPTrgKyzAv

Am 29.12.24 um 20:44 schrieb Kurt Borja:

> Hi!
>
> Happy holidays. :)

Hi,

i just noticed that your patch are missing the "platform/x86:" prefix. Please add this prefix
for the next patch revision.

Thanks,
Armin Wolf

>
> ~ Kurt
> ---
> v1 -> v2:
>
> [2/20]
>   - Small correction in commit message
>
> [5/20]
>   - Define the sysfs attributes without macros
>
> [6/20]
>   - Reworded commit title
>   - Reorder variables in previous WMAX methods too
>   - Standarized sysfs method names in hdmi, amplifier and deepsleep
>     groups
>   - Dropped Armin's Reviewed-by tag because this patch changed a lot
>
> [7/20]
>   - Return -ENOMEM in case priv allocation fails in alienfx_probe()
>   - Assign priv and platdata on variable declaration
>   - Drop intermediate *leds in alienfx_probe()
>   - Add quirk_entry to state container
>   - Use quirks from priv on hdmi_mux, amplifier, deepslp visibility
>     methods, to eventually be able to move these groups into
>     alienware-wmi-wmax.c
>   - Set PROBE_FORCE_SYNCHRONOUS to platform_driver, to avoid racing to
>     drvdata after using device_create_groups on [8/20]
>
> [8/20]
>   - Create hdmi, amplifier, deepslp sysfs groups on wmax's probe
>
> [9/20]
>   - Assign priv on variable declaration
>   - Directly return create thermal_profile() in alienware_awcc_setup()
>
> [10/20]
>   - Refactored alienware_wmi_method following Armin's comments
>   - Fix legacy_wmi_update_led logic
>
> [13/20]
>   - Split DMI table lower in the file
>   - Rename quirk_entry -> alienfx_quirks
>   - Rename awcc_features -> awcc_quirks
>   - Make hdmi_mux, amplifier and deepslp `bool`
>
> [16/20]:
>   - Only add common resources on alienware.h
>
> [17/20]
>   - Reworded commit message: now mentions some blocks were reordered
>   - Move #include <linux/dmi.h> where it belongs alphabetically
>   - Included hdmi, amplifier, deepslp groups in alienware-wmi-wmax.c
>
> [18/20]
>   - static inline init functions in case drivers are not compiled
>   - Return errno in case drivers are not compiled
>
> v1: https://lore.kernel.org/platform-driver-x86/20241221055917.10555-1-kuurtb@gmail.com/
>
> Kurt Borja (20):
>    alienware-wmi: Remove unnecessary check at module exit
>    alienware-wmi: Move Lighting Control State
>    alienware-wmi: Modify parse_rgb() signature
>    alienware-wmi: Improve hdmi_mux, amplifier and deepslp group creation
>    alienware-wmi: Improve rgb-zones group creation
>    alienware_wmi: General cleanup of WMAX methods
>    alienware-wmi: Add a state container for LED control feature
>    alienware-wmi: Add WMI Drivers
>    alienware-wmi: Add a state container for thermal control methods
>    alienware-wmi: Refactor LED control methods
>    alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>    alienware-wmi: Refactor thermal control methods
>    alienware-wmi: Split DMI table
>    MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>    platform/x86: Rename alienware-wmi.c
>    platform/x86: Add alienware-wmi.h
>    platform-x86: Split the alienware-wmi driver
>    platform/x86: dell: Modify Makefile alignment
>    platform/x86: Update alienware-wmi config entries
>    alienware-wmi: Update header and module information
>
>   MAINTAINERS                                   |    4 +-
>   drivers/platform/x86/dell/Kconfig             |   30 +-
>   drivers/platform/x86/dell/Makefile            |   45 +-
>   .../platform/x86/dell/alienware-wmi-base.c    |  492 +++++++
>   .../platform/x86/dell/alienware-wmi-legacy.c  |   98 ++
>   .../platform/x86/dell/alienware-wmi-wmax.c    |  775 ++++++++++
>   drivers/platform/x86/dell/alienware-wmi.c     | 1269 -----------------
>   drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
>   8 files changed, 1518 insertions(+), 1296 deletions(-)
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>   delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>   create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
>
>
> base-commit: 03f8e0e05510dad6377cd5ef029594d30e6c096d
