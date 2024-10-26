Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5932217F22
	for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 09:53:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729936442; cv=none; b=bhE+zTA8LjtWhsrPf1VNvKiZTIl/T9W2sp+YmVzpnVHJ+O569S9yA2xTHAw49Zym85blRjVW2jsM6SP0eHghveHxz9z9CMrKPLIBHRtvn+1Xila9StSdYQkv/SoJUc7UvFGDRfJQLp2HDLRyi56Yae54Qmz2AuLRGEq9LaZx1Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729936442; c=relaxed/simple;
	bh=tdykJwDjjUc6RlmYBwAgbKMSsCDo4jhYpFXAs9pnO3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZKUb+BwWQZb3JeBkzGbwZBhofgzjDWur85yapHYykGpIrcEGb3RQtFwOyazdFo+S9dhni0V5l16js09KAifpXawcu7f/PeKMhCFJm3aLUFEjsBK2UG+kY/rv2HN4VCnNJ0mC6UO5JtPJ100RF4yCBpKwZGva8sqKxPZlHIusCvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ACuWCGul; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ACuWCGul"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729936438;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mnjqp6uY2F6lf7q1X7RSsH54Ybe3GgWi0/vIEHoY1bA=;
	b=ACuWCGulG/j6u4VR4bDJ4JtOh9TErWD7b3D7NoPqTAM334qZKHoQ9yOB+Kr2+e8SaCie9Q
	w39pZ0tKxPys8Zp0ZAVNpOMUBDWTyjd74scR7KvE2J0Ga1bsHqo6BH04EgMVlNuSxhImR2
	Ps0ZozaxIYRUS0qQYe6V++dwCL+jYkA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-rsJelCv4OXqmsti2_DS8tw-1; Sat, 26 Oct 2024 05:53:57 -0400
X-MC-Unique: rsJelCv4OXqmsti2_DS8tw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a9a2593e9e9so194460966b.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 26 Oct 2024 02:53:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729936436; x=1730541236;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mnjqp6uY2F6lf7q1X7RSsH54Ybe3GgWi0/vIEHoY1bA=;
        b=kftX8WVbEJ4/a4T+H/ndLddZaeOWPta3ci772EoqRzj0LFxoF4Oh9w4x8x7qDtPPji
         NHeYTeYZqzcDaB7n26BwjTdX25lnzvX/FagOTCNJxrOSFGISHaZSsHV2wuM6dytdZGZ6
         7eJ/3Aj/T2gkh9kPn8hxTRI8H18Iy54jQRKHV/v379XsnTC+5UqbYvm+KHivGO5Pb4P/
         w9EYcfUFcCJKRgXAc4qzYSlW8Hvcg09FHgnDo6IYC4VkkNKusxxmBGBZDrUHumH4ls5m
         5OpToISzM+GQPDypQdMIXwBXM4lxyV4MfGSKzy4MDol1+vOI2ZXOViuAF6WjiuJXtvwv
         H+Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUaNggoIRiB7dbKQRKeV79sd+mKY1pJyJRlOSBI3J362ihiZqcUKWsrrvNKRMvATxr04p9HC4+5f5OkoZI+TXjDzcvv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6LkQaQsBThrBPjV6RfUVSvfv1N/NZM2/C8JDgfJsPnOsVnxk2
	uiL9086Z2bzh0uxg1Llz5lYJ5JLf/TinV8+wboKME8WA4kV0rSDRmdMqTCvCaBwkVKoaCaCHLZ0
	uNVZIHA+cNyDAbTlitfh/dueD1TNemylFIYRzJxXSvsCRWUH1Vd/+I6gjDwEO07LOCRdue4M=
X-Received: by 2002:a17:907:74b:b0:a99:37f5:de59 with SMTP id a640c23a62f3a-a9de619182amr134740566b.53.1729936435659;
        Sat, 26 Oct 2024 02:53:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQqMOL1ZFWcf453dgqb7oobR+mCmwgih8sbvKP1B1FGHkeWNTgKvWr3jCjIjQi4ZR9SKDWng==
X-Received: by 2002:a17:907:74b:b0:a99:37f5:de59 with SMTP id a640c23a62f3a-a9de619182amr134738566b.53.1729936435185;
        Sat, 26 Oct 2024 02:53:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30c7b5a9sm159784166b.171.2024.10.26.02.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Oct 2024 02:53:54 -0700 (PDT)
Message-ID: <0156ec27-e076-4c6e-9bad-b7d64bb08a59@redhat.com>
Date: Sat, 26 Oct 2024 11:53:53 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] platform/x86: asus-wmi: Fix thermal profile handling
To: Armin Wolf <W_Armin@gmx.de>, corentin.chary@gmail.com, luke@ljones.dev,
 mohamed.ghanmi@supcom.tn
Cc: srinivas.pandruvada@linux.intel.com, ilpo.jarvinen@linux.intel.com,
 Michael@phoronix.com, casey.g.bowman@intel.com,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241025191514.15032-1-W_Armin@gmx.de>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241025191514.15032-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi All,

On 25-Oct-24 9:15 PM, Armin Wolf wrote:
> When support for Vivobook fan profiles was added, two mistakes where
> made:
> 
> 1. throttle_thermal_policy_set_default() was not called anymore during
> probe.
> 
> 2. The new thermal profiles where used inconsistently.
> 
> This patch series aims to fix both issues. Compile-tested only.
> 
> Armin Wolf (2):
>   platform/x86: asus-wmi: Fix thermal profile initialization
>   platform/x86: asus-wmi: Fix inconsistent use of thermal policies

Taking another look at the vivobook stuff because of this series this
pre-existing code stands out to me:

static int fan_curve_get_factory_default(struct asus_wmi *asus, u32 fan_dev)
{
        struct fan_curve_data *curves;
        u8 buf[FAN_CURVE_BUF_LEN];
        int err, fan_idx;
        u8 mode = 0;

        if (asus->throttle_thermal_policy_dev)
                mode = asus->throttle_thermal_policy_mode;
        /* DEVID_<C/G>PU_FAN_CURVE is switched for OVERBOOST vs SILENT */
        if (mode == 2)
                mode = 1;
        else if (mode == 1)
                mode = 2;


Since the vivobook has silent and overboost swapped I wonder if we should
do this on vivobook to ?

Also note that patch 2/2 of this series impacts this code too. Until
now we were storing the swapped vivobook values in asus->throttle_thermal_policy_dev
and then here we are swapping them a second time, in essence using unswapped
non vivobook values here due to the double swapping.

Where as after Armin's changes from 2/2 we now store unswapped standard
asus laptop values in asus->throttle_thermal_policy_dev and swap them
here, using the same mode values as with normal asus laptops on vivobooks
now ( mode is swapped from non vivo throttle_thermal_policy_dev values).

Does anyone have any insight what we should do here ?

Regards,

Hans



