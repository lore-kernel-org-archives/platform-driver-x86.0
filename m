Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65235387561
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 18:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241848; cv=none; b=ZMMJmVmx6kdpwcDS2vS0sA1wamV3sIBtaxRtd9I8xPmU5ULJO31RvbmIttm82V6GlGFKHS8cG4F9UfrZTgcvnUmBM49IIT3JV4/I7ezwevHgv3MDm8g+8hVHUW1+MAvQ+C6ILIqLytT6vuG2YrW+saKL2tbJkLtueP1zRq//Ezw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241848; c=relaxed/simple;
	bh=HZWb8NTGhICIn9r0/1N4Kr1/FZT+Sn4S6zblZ/laKMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tVG/aUXE+p94T4DRNvRvoKbPyLGd2rH356d9hpMm81Q9+bF0hCpVU5i+gA6KulYTeyAH+7LxlFQcTxaVOfQn6FOfJjPaginw4enuSeid/JXd71S8FSW40mYKbn8FO6h0U9E8MeOK77tRlUy8WpDy9ZYaZ8ki5s/p8Psszkd4bJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GjUYMmq6; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GjUYMmq6"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a1022dda33so42216585ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jan 2026 10:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768241846; x=1768846646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EtGlqg5k06i3Wt6eqTAnbJ1drNbM/2MSyECysgkVtSA=;
        b=GjUYMmq6ihpSNNICeV8pA9aAnEwbo7l5+C1FcMLtFJkog3GMNjZS4b+3gKO2I+kcAG
         G5xp1Z9cm3cNSrgWtcknFTtzEsEU6QHytB+8jouGSBN3HwUtlL3uvF3fAfuUIQlwJ6dx
         xMDiVzBIH4uBIYyb7Vay7ibt9JmDcXKj/UYI7++pjCiuHkPEaT3kK2dARWiBR0HSbQkU
         +0Y3xZgv5VJnja7qmmSwyl9dvO3Y+l7fc57oiZKCkexMUxS7jHlP+tymQ5PbsutffLVH
         XrgXGQsx3xMDY8/polrh2VZ8jCg28y0A1gfT2m7xpPEUoYwX7tWJXIZKjnHP4qeNiNip
         nBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768241846; x=1768846646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EtGlqg5k06i3Wt6eqTAnbJ1drNbM/2MSyECysgkVtSA=;
        b=rAqGzmvrmUInfoC/SAiRcZEiShYImF8wGTKSazXY4Lsf+uvIfvwfHAUM0K3gO6dRVq
         K3Iwb7Te887C64RdKaembLQ3S0VtYLquneA4ujmQqqQ0HSP9a7UqmS10U+TnLYqkxn6a
         nRVlHaTe9i5w4/3Cz1hlhGKsqJWA+n7ajn8S7ifaiFiGcTuYNUf7lo0oa8PPiNlST6Zy
         QaeEZ+5JTyaABl/zJ7SOdgE+zDf8T6FQRFj6roHzm/1LGa2OdmWXENobsBK9E/v9YQxB
         v4Lo1uswyCXwgWYSuUBpQ1nDfW7Kb87izRmnWyTfdOvLJjzo2trkqH5D7jgeFsjQiUCX
         t+/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMldylIexDAlqqb5pJaaum8Bz1J4sbvWakoHIpjo1dEHl1KjezoTGq59U5V+xRo6gUgfgZ9By4uz18sxO4R+jeltQT@vger.kernel.org
X-Gm-Message-State: AOJu0YyrwDOB831dM+QcmIt670jIL54bDHwmjT+A6wVBjrnZZfdlGGk0
	T8vw0kse2vsnlem5/vqUWcmqDr60lNo9CG3UIVp54y8Y3qBDiZrKDoBC
X-Gm-Gg: AY/fxX77HeqAvMXeUHbLMiZTwb3kEsiUbtOCK45YtM8mZJe67lizB4s+i4j9XpyCrLE
	FIu9eWYzJIXIWgZ5V0T//cAMKmvecxET4hHoUWyPNZh/W8mOvojXVWXiijVaXqFDmYu7tCPk3Co
	598pFyaNyrLVibtH0JUjtbDnmFyXrw3qIUMV28dMsyFr4MZEiaGC7LnUBqJ2KI1B9EWc40jroRb
	i2I2docxlIBGDj3xUm6poDlMCCTiK63Z/NgkC/GB3C0ddy+8tHqkrxefg6nrpf9PSXvAKTLysLO
	Gc9AgayupMMqPqYBDsInD3G/7gg1YxF3Acri+nYpzjjK5O4fN+2gQ3EVODXt0i27XgqzuCjKXpM
	u89D7QHsGPFqTUPLDSUat/VOVJIMF249gYe/qGn3tPE+ZXIBcMQUAFQzT3jBXu9UG2RNwl1F+sZ
	ngGkhGvM+uj/2GHXN694c=
X-Google-Smtp-Source: AGHT+IH67SsAmDW+XdcDdNkuZHCuju5RGcFncESFWYkzYZSMHpAuj4JZCKO+lnsTd85qUcAxrMy/lg==
X-Received: by 2002:a17:903:1b6b:b0:2a3:c667:e0a0 with SMTP id d9443c01a7336-2a3ee47dee7mr204871275ad.29.1768241845516;
        Mon, 12 Jan 2026 10:17:25 -0800 (PST)
Received: from archlinux ([2405:201:1b:225c:eb9d:1fc0:f95c:bd90])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2debsm182203665ad.65.2026.01.12.10.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 10:17:25 -0800 (PST)
Date: Mon, 12 Jan 2026 23:47:15 +0530
From: Krishna Chomal <krishna.chomal108@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>, linux@roeck-us.net, 
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: add manual fan control for
 Victus S models
Message-ID: <aWU5Mf89hTifpewY@archlinux>
References: <20251225142310.204831-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-1-krishna.chomal108@gmail.com>
 <20251230145053.516196-2-krishna.chomal108@gmail.com>
 <ce48f7b8-7d88-266f-ca8d-6af3b01815db@linux.intel.com>
 <aWUvvzDCtVCOaBwq@archlinux>
 <f6ca0445-431a-f9d7-eeee-0d437efa3c76@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f6ca0445-431a-f9d7-eeee-0d437efa3c76@linux.intel.com>

On Mon, Jan 12, 2026 at 08:08:29PM +0200, Ilpo Järvinen wrote:
>On Mon, 12 Jan 2026, Krishna Chomal wrote:
>
>> On Mon, Jan 12, 2026 at 05:13:05PM +0200, Ilpo Järvinen wrote:
>> > On Tue, 30 Dec 2025, Krishna Chomal wrote:
>> >
>> [snip]
>> > >  #include <linux/string.h>
>> > >  #include <linux/dmi.h>
>> > > +#include <linux/fixp-arith.h>
>> > > +#include <linux/limits.h>
>> > > +#include <linux/minmax.h>
>> > > +#include <linux/compiler_attributes.h>
>> > >
>> [snip]
>
>Hmm, these should be ordered alphabetically and if the existing one
>aren't, try your best (or add a patch to fix the order for all).
>

Ok, then I will add a separate patch to this series to fix the ordering
for all includes.

>> > > +
>> > > +struct victus_s_fan_table_header {
>> > > +	u8 unknown;
>> > > +	u8 num_entries;
>> > > +} __packed;
>> >
>> > Please add #include for __packed.
>> >
>>
>> __packed is defined in compiler_attributes.h, which is included in this
>> patch. Please let me know if there are any other headers that should be
>> included.
>
>Sorry, I don't know why I didn't notice it (too much reviewing in a row or
>too much multi-tasking I guess :-)).
>

No problem, I understand. Thanks for the quick feedback.
