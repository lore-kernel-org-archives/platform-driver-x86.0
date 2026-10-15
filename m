Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30EE5111A5
	for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 09:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792058118; cv=none; b=rVCTIntmoyG3xdQ6qptQ4NkLVWi/Gc2coqpEN15qhUHOS4gyRWAD7u2NuiRt+PIVz3NaIhVNDvFNitS58kIOd6me2aPBDB3a6S64Ejvxk6SY3PRdg7LKy8EtHf9yNchK3qq4sOr1QSV7Sk/2kXsKC4uve2az9bFzKwhtxV48AFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792058118; c=relaxed/simple;
	bh=JLGAow2rLUO/+TKOPOX0VJmztAPGduP307ghbO3dOEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KW01BkuEnHEGiLE1sIYF5HOLVJloM4Gfo53PqwKiI0fcmy4REA/C67d+RM4/uPiKHRS3PM9Gqfl7WThAwT+3l48jDLrVtTlA7I/Pf8MzB4fnl5jmc1mqsTHXBUsvwoMlSAWrcT1BBwgurxHuEBQFk79HCip96HfdlOafvWflV+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rjV9QYzv; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rjV9QYzv"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-533778ab0bdso57721661cf.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Oct 2026 02:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792058112; x=1792662912; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FaMd1QSYMqEo5wIiy4wQAPVusgGd/ylNS3r3kXBy7sc=;
        b=rjV9QYzvJMPx4FYBxMEwoe/VqHo0fj9IqklI3SEAkS4+Dzagc00P3KLWV78SuopmeF
         yXqu0bRHT2nXtDgUlGeev3n6XalrLHQjZeWITiFuSSWF/zdPZJh1yL5Gv7Nc9PtKDkRO
         PQY5/BnLXFghyXKWGlR6kU4FBz7+iT6XjQ5iv7eX23RGREMrGF8yjId2O5Ruv0BxexAz
         HV4H4TuvpdnY5GVqbvXjqAiifeGRs/kSLCbbYdr5VhOyhMIrlyCOrX4gr93BDugT8/l3
         u//zaNCJGDDzmefMEWtC7DxxVBls8fwdITWx3gY0Z3lZmqWCK5CFOL0iDefbpAWf5bww
         L3PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792058112; x=1792662912;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FaMd1QSYMqEo5wIiy4wQAPVusgGd/ylNS3r3kXBy7sc=;
        b=msu09Yau9RkZxRbqu08XxkzQ5zsnnguWqu/KLdtFjJRHC7Cb6k5wZAf8uJghx1i0wE
         jREDkzFiSisnTw37m0unlnzZZu3NnpWPc09uqU3ZWS9mT1gCnn8p9WDj7CBLoP6ifCJL
         IF5kX5BvbxjUJdrpBvvlK/XOB8UzfwBmOSZhFnrKRsrCxEL61GEk7X4fnoHeaZDV0tQJ
         XlYKnWCaZjZ7+1uvvZsm2ye3xseoCUJuSE65IRSZ+BHG/3Y/5DYmFIq4c2wL+IeRNyoP
         OrxSITGfh0bKJYzH0gXvm4ziQWc/f3gJnymw+42kLpMztyPO/C7GFJOfU94d7LtowU4f
         3EGQ==
X-Gm-Message-State: AFq9FYJLQ66GtKuePN25PYi4PbNasvPmNWW49KH00LPkXEOSYT71Aw0i
	17/h4RQTu90earUKfDQUcSByU1IYHpl02lN0WhGtOfUVxdwUA2pNSt0lEhJZyw7NfUM=
X-Gm-Gg: AYBFou1LzwSajCuEyX4bwf6vt8yRXvOkdfxF9JQyb9atbiJX3RSY7ivo0A1eXcMo51a
	PR1iZNjmtY210zw1PcG1Zsm6kz7Tp7GKF5vdCRinYD07pEpqsk8mmzgVk/sFw+wtK79/QivSiYw
	v6h9YC5+QIaCTUvq1hr7AnjXISUcqcaTXgbEoGOr6RBVNGNNJLDrrymI0/hVBPJNhsZhI1SCnCM
	IZtm4fpFW2shfioUS6mlQ+CoWuhpV+kDxH3NF1I5dGGedApL4KeRt8dFUj1rEwXwdU3DSoHQZQg
	dPFAkUcPIi2BlRk/zfsRPF0VlaAbTf1jZh701O0lmAJAKGgLdxng91Q0yWcQrRxUCg7QzPCfeso
	poSQ2c252FAwe16su2UfWIQQlVx3/QzNKDLZ9sELqcBZ6W2xZSHsM3Um90DdPoLXFFVeivWG1ih
	Rhyegh35rbEzMN9v9qlJHhcKgDTBz9jIz9+tLRIPAVWaWwsMjIdVwohGm5bB8tTCxCZeJ0RXSWe
	/SR2H0T+R4tT/T7nXsNeSBO+AlM2jxvkI/iHnlI8vKA
X-Received: by 2002:ac8:5d8d:0:b0:532:d6bd:1b3b with SMTP id d75a77b69052e-5359fbb3ad8mr327227621cf.52.1792058112058;
        Thu, 15 Oct 2026 02:55:12 -0700 (PDT)
Received: from [192.168.60.5] ([207.115.103.98])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5361269f364sm21663911cf.2.2026.10.15.02.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:55:11 -0700 (PDT)
Message-ID: <2df90a2a-770b-4439-9d01-bd8105084719@gmail.com>
Date: Thu, 15 Oct 2026 17:55:07 +0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3] platform/x86: panasonic-laptop: Add
 platform_profile support
To: Wu Zhipeng <zepwu@foxmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
 Hans de Goede <hansg@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Kenneth Chan <kenneth.t.chan@gmail.com>
References: <20261007190446.38862-1-alexyeo362@gmail.com>
 <tencent_7F39F02728B55CE3B1878AAB51BAA0FE2D07@qq.com>
Content-Language: en-US
From: Alex Yeo <alexyeo362@gmail.com>
In-Reply-To: <tencent_7F39F02728B55CE3B1878AAB51BAA0FE2D07@qq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Wu,

Thanks for testing the patch on a CF-SV1.
While the fan curve was observed to change, it is interesting to note 
that the CPU wattage appears to stay the same after an unlock.

Based on the data, pkg max temp is a bit low which does indicate the 
possible presence of a firmware level power limit.

If you do find the time to test,
may I ask if you have thermal and power data when running Windows?

Initial observations that have resulted in the creation of this patch 
series were made with a power meter (can be a watt meter from the wall 
or a watt meter from a USB-C PD monitor).

On the SR4, maximum on Linux was around 42W, while Windows had spikes 
that went up to ~60W (on the AC charger) or ~80W on a 100W USB-C PD 
charger. (in addition to the higher CPU temps with all settings on both 
Windows and Panasonic utilities set to performance)

Application of this patch on Linux with TLP set to performance resulted 
in similar observations when testing.

Additionally, may I ask if you have tested to see if thermald affects 
the fan or power setting?

Running it once in my case with the defaults has resulted in power being 
unlocked until next reboot. This change can be observed with both 
turbostat and a watt meter when plugged in.

The DMI quirk code is appreciated but I'd like to clarify the power 
unlock part first before including it.
