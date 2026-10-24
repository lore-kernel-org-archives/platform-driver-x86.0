Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792849868;
	b=U69lkhVNi+jcR4TnKEGktSHCGlnTqIE73gUKZ+PEfu+/Xg1Fv9hxukVrMIgmEGK9nJ+B
	 FQAVdyUPo673VJ9Fu0m9POV7/YSl9/EqQ4GED3458sZpF20wb3pId/SDL4K6uq1vTILzX
	 lxAmGX2dPcDrlP9Wi04WoYQdZDP+dxUF+2sWIuksqRnJndDwznAd/AXFZf+B4lXvQUe9z
	 x7M62b6KZy5pHgGwGQCIPNmxmpKe/pjmrF8ynf00zCU29oz8n5uLPkVnU9V5WIc8L6N+g
	 FnwBUilq9MjJogjYMTnAXnwNMEOm6iABJHxuaRCvxQVmBFjfKyAZJbWUcdIYN23bOAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792849868;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:Subject:To:
	 Message-Id:In-Reply-To:References:X-Mailer:MIME-Version:Content-Type;
	bh=FzMTW/GzPoZ2q8Pldb18GdeHt9ixP87PaMg7vgm71ME=;
	b=BjVz1IvUTQusM1tNYMiMN+J+UewPMzkU/xuN7462CUbCef7p+ZFF/Cp5HFlHZxwDVBzy
	 z1i2i/QHMxkP1LWG/8gaUmsH7ROgglK/6LhrLI3eXbj+ntlp3ph9ig26fdT4A/m+OGFs6
	 HEFszLlUbTXCij1m+wPVVdZCpcz6fjxkOIc1lzLFQUCKGkyh3SczdP3aATYrwj78gQglR
	 yuKDYqL/rQstz/lwy0DTej9htrP9eNAm5vSNM9nj4bWnzlaUoV2QU7zFKcVMTEAaDb8KF
	 8bRO2VeFKDO/QqJVazUyhl3qL0kcmuu5JwO4kbh2YIsdhjRIyyY4uQGy2WvGv6SWKuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y2c+USOa;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA12606A31A
	for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 13:51:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AA12606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Y2c+USOa
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e00eee27dso1092087f8f.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 24 Oct 2026 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792849866; x=1793454666; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:to
         :subject:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FzMTW/GzPoZ2q8Pldb18GdeHt9ixP87PaMg7vgm71ME=;
        b=Y2c+USOaUkFAqK6YV+ZaEiHdDn/U9WQ6wUS8f559n1V+OTB/O1KbpupbrijRHxOXJb
         RIr7H6J3As9x6H/gLeS5chIezZyjmeo3t0RlVrLix1/rEdhttDn82dvGBq2KYdsrUoxu
         IvjWHKqm8DSfQQzxGI+j93VNvSNM2/nLCAVGAwoTnQHFZu2GuZkBE3I4qK2pPDAKnWTR
         M5iKK2XXVZZhwUrib1n7TTLP4BTkx7M9FozeYRYTbWOH2g4+afINCMFF7TbJ0559Qm4p
         Udwb61Wv93PPEqVanuWnyHk/Ndk4WqC6+zUWhH7EHur2rjbhXLnZmxZGtlPoFMLg+3Ra
         67jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792849866; x=1793454666;
        h=content-type:mime-version:references:in-reply-to:message-id:to
         :subject:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FzMTW/GzPoZ2q8Pldb18GdeHt9ixP87PaMg7vgm71ME=;
        b=aaM5FWSbfblFjm5KGF1yX+B/fqbgEd+i747hl4ITX7AdQT1jtyvUQfw3y3MMPSli0O
         SU4VErYwulfcXLWQbyOZ+BZ5/0s1mK2Cdno2sSydBx6ugsFlrGo7+GUYCMsBpyVjeRjS
         yQSKNLeDEJl0ITaUhMP1gwbvY/Ervx2pyfgn43T5QUYnNGiVPACPNCTx3QvqnOnds8ak
         3Q3zPRxn6pvt29txCC0UhlINsO7vLCUEGEnfVD9ot3cGkHuLXcL2IjX5c77pTkkO053z
         wbVJUgNPLwtdWxR3mJxKQwrYXslPW5HbYqDaj4YTXg6fAaWa3V/+8meCCR/NgC2eu+Rb
         FfXA==
X-Gm-Message-State: AFq9FYKqPlpWew95rfGQSVIvT7MQLS0+tbOveNT3WiWhrdHqGygfTi2/
	AOx5bJ1gs0wPAtzbgXS1LcMYdI+t/ukJLakXeb6xWBeVUAHghnjUIQ/Ybs9Atg==
X-Gm-Gg: AYBFou1LnH+5BM1GXYS/KKyADz02WPkmBKWc/zZWBKgu/QArgnWAwxkxpcBdB1LjHNe
	hQG4rBMwnvCkT/XOn7hEOlvkhgXV3pZ8GZ+PlxT0LGfjLWUkmMerZGZTByOavd7ihImxnfFJblx
	poGfMcr//z5/LNM2aOwzm9NFMdnhk/L+phL9+CuB7dHLfoZgizfS3xDHuyfDjy9Lkx535VevN3g
	UMzIGUWwrb6iyTiDM8BIfzUR7Gj+Azv6gjZ6RI0lXlXK9rscli3SFHcZmJTWqf/cd31g8c5FV8H
	9CYvZX9ZNRkOGOn9EpAQ4X1Ff+rMnK7fyTScXwXBnV5G0i06YaDS+hlg4RNXHi+LJ89/QFMBuwI
	Zz9Sm1rNLEReQb3XjhBgb1JuWCujrBoR3vlu77YcY0iOh04eaCh4/FzM5WNULzbJliTkt7VuNO8
	d4Zz8po/XyXoDOuFrxVb4y/Z6eGmjeaFBXEM+vO7QoIa3uCXp7PWWaqEqR3iaNn1amMMGxatP05
	RxD06U40uK3Q60RhziDhCYYp676GfxP8MD/NjzMsDH+LO2EgPRSbYC5dXxYGhWIB8GzhuCFu4ge
	mF/Sx0B8MOPsxdxn+R/ab679xjheyrQYs7pPM54EDEzG0gR4zJqCE7N5njr4HFGg4CFHipmMRBp
	rww==
X-Received: by 2002:a05:600c:3544:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a35acc6b74mr33233505e9.34.1792849866270;
        Sat, 24 Oct 2026 06:51:06 -0700 (PDT)
Received: from ?IPv6:2a05:b100:188e:3c00:4d27:e94f:1af:364b? ([2a05:b100:188e:3c00:4d27:e94f:1af:364b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a55e786sm68246255e9.3.2026.10.24.06.51.05
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 06:51:05 -0700 (PDT)
Date: Sat, 24 Oct 2026 14:51:00 +0100
From: Teodora <teolyub@gmail.com>
Subject: Re: OptiPlex 7400 AIO HDMI-IN button requires WMI startup method
To: platform-driver-x86@vger.kernel.org
Message-Id: <0TZENT.54P2IBFQRED22@gmail.com>
In-Reply-To: <OOZENT.01UBB4ITK3LK2@gmail.com>
References: <OOZENT.01UBB4ITK3LK2@gmail.com>
X-Mailer: geary/46.0
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Post: <mailto:platform-driver-x86@vger.kernel.org>
List-Help: <mailto:platform-driver-x86+help@vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
List-Owner: <mailto:platform-driver-x86+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed


Hi,

I have a Dell OptiPlex 7400 All-in-One machine and have been 
investigating why its physical HDMI-In/source button works under 
Windows but not under Linux. I wanted to flag a potential solution, 
though I am not a kernel developer but was hoping that perhaps this 
could help the community.

So, my system details are:

- Dell OptiPlex 7400 All-in-One
- Fedora 44
- Kernel: 7.2.11-200.fc44.x86_64
- dell-wmi-aio is present and loaded

While investigating the Dell Windows OSD software, I found that the 
button generates a WMI event through Acpi_OSD_event, GUID: 
02314822-307C-4F66-BF0E-48AEAEB26CC8. The GDat payload generated when 
pressing the source button begins 02 00 00 00 F2 DD which corresponds 
to event/scancode 0xDDF2.

More importantly, Dell's OSD service invokes another WMI method during 
startup:

    Class: AcpiOSD_WMBC_method
    GUID: 2D703EE8-36AC-4F88-BDB5-7556CE6B2946

    Method: PegaOemNotificationStartUp
    WmiMethodId: 1
    Description: "Invoked by AP when system up."

Linux exposes this WMI interface on the machine, with instance_count = 
1. I wrote a minimal test WMI driver which binds only to this GUID and 
invokes: wmidev_invoke_procedure(wdev, 0, 1, &input); using an empty 
input buffer.

The result is reproducible: After a normal Linux boot, the HDMI/source 
button does not switch the display. Then loading the test driver 
invokes WMI method 1 and the firmware reports success. Immediately 
after, the physical source button works correctly and switches the 
panel to HDMI-In. The test module can then be unloaded and the physical 
button continues to work.

After rebooting, the problem returns until method 1 is invoked again. 
This suggests that PegaOemNotificationStartUp is a one-shot firmware 
initialization which Dell's Windows software performs at startup but 
Linux currently does not.

Below I am sharing the small module I use as a workaround; this is 
loaded once on boot.

// SPDX-License-Identifier: GPL-2.0

#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/wmi.h>

#define DELL_OSD_WMI_GUID "2D703EE8-36AC-4F88-BDB5-7556CE6B2946"
#define DELL_OSD_STARTUP_METHOD 1

static int dell_osd_probe(struct wmi_device *wdev, const void *context)
{
 struct wmi_buffer input = {
  .length = 0,
  .data = NULL,
 };

 u8 instances;
 int ret;

 (void)context;

 instances = wmidev_instance_count(wdev);

 dev_info(&wdev->dev,
   "Dell OSD test: WMI device found, instance count = %u\n",
   instances);

 if (instances < 1) {
  dev_err(&wdev->dev,
   "Dell OSD test: no WMI instance 0 available\n");
  return -ENODEV;
 }

 dev_info(&wdev->dev,
   "Dell OSD test: calling PegaOemNotificationStartUp, method ID 1\n");

 ret = wmidev_invoke_procedure(
  wdev,
  0,
  DELL_OSD_STARTUP_METHOD,
  &input
 );

 if (ret < 0) {
  dev_err(&wdev->dev,
   "Dell OSD test: startup method failed: %d\n",
   ret);
  return ret;
 }

 dev_info(&wdev->dev,
   "Dell OSD test: startup method returned success\n");

 return 0;
}

static const struct wmi_device_id dell_osd_id_table[] = {
 {
  .guid_string = DELL_OSD_WMI_GUID,
 },
 { }
};

MODULE_DEVICE_TABLE(wmi, dell_osd_id_table);

static struct wmi_driver dell_osd_driver = {
 .driver = {
  .name = "dell-osd-wmi-test",
 },
 .id_table = dell_osd_id_table,
 .probe = dell_osd_probe,
 .no_singleton = true,
};

module_wmi_driver(dell_osd_driver);

MODULE_AUTHOR("Dell OptiPlex 7400 AIO experimental test");
MODULE_DESCRIPTION("Experimental Dell OSD WMI startup-method test");
MODULE_LICENSE("GPL");

I hope this would be useful as not having this function has been such a 
bugbear for me over the years, especially on a business machine.

Thanks,
Teodora


