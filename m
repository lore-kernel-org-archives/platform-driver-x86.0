Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52631A69
	for <platform-driver-x86@vger.kernel.org>; Fri,  5 Jan 2024 16:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hZL7sbjc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704472450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TvrYVDC7Xe39kH8XwXBOfXEeoo0O4JfUtp7RmcXFdzY=;
	b=hZL7sbjckelNAr/9P1IKkDFRoQXahZWWtmL//3wqrPLoqcxuNR/gONcjN3Z5pSPz9TgE1c
	+kAqLVRKiimZBXMHWe4pcaM78EFjWD20Ir2Xkkpq5PUkWD0iRsMtY/208NRPIOLPTrFmYA
	XZjTnZNclmXV0yOM9ckr1SayMntD/D0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-HeB4vODPM4C_qFVkjT1P3w-1; Fri, 05 Jan 2024 11:34:09 -0500
X-MC-Unique: HeB4vODPM4C_qFVkjT1P3w-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a280f442420so69736866b.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Jan 2024 08:34:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704472448; x=1705077248;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvrYVDC7Xe39kH8XwXBOfXEeoo0O4JfUtp7RmcXFdzY=;
        b=pMwQcfbgzlgVRBlxZDAQMn5HtKkVD/BrStbQg4v7eIsoFRBeEIza25dDTa7rXPq5Nx
         xR9RhPPLVYQO+O4rqN4fpp2+Zf5/2tFXU9S1sNuY9eZRm5S6Rrc6sKNvP7SR+LVizGe6
         YbpQu7fO5BeuRrZliK9X/vO8T86E03SqIumyRoiEtduKzH+NlEJKb14t7KUaRbKrcUFm
         LoecT2oib3ACBYr6cmAqPaTz4tMZn761eVyn0ATEA9UBSW94xD9C/uQD3jrJoP2pSR49
         wLwQzfszbM4BEL2fWrPEHiT3RL+/a3yfD2smrNcfjpLPE4mUDUVi3Q8VgnIe4v+WgT4p
         hXCw==
X-Gm-Message-State: AOJu0YyTXCzKWrNJB4+XjhGydNHX46RIPc7+NY4MkxYG3FF7UqstcDti
	xxtyQvHN3I/Lu1RzXvKLligtmNMXtCJWGYW6lI97OEEfzlanodsUQLzyYwGTWoaKaNxfAaKB9Je
	FoDj/sS15Mt+dTr9goBeleX6bmmc7gsZ/SYXuyk2+fw==
X-Received: by 2002:a17:906:458:b0:a26:e35b:9e1e with SMTP id e24-20020a170906045800b00a26e35b9e1emr1202795eja.109.1704472448516;
        Fri, 05 Jan 2024 08:34:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFybZWiIbWlOyg5WkjkHtKqX4oUAwM+7I6+fh4z3/048a79AUTSLrL0aXwZaOPZXWBEjPGlXA==
X-Received: by 2002:a17:906:458:b0:a26:e35b:9e1e with SMTP id e24-20020a170906045800b00a26e35b9e1emr1202788eja.109.1704472448197;
        Fri, 05 Jan 2024 08:34:08 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id n4-20020a170906700400b00a27051a9eb6sm1049181ejj.148.2024.01.05.08.34.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jan 2024 08:34:07 -0800 (PST)
Message-ID: <c3d903e8-6611-43e9-ab31-44e92371b0c3@redhat.com>
Date: Fri, 5 Jan 2024 17:34:07 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] platform/x86: dell-smo8800: Instantiate an i2c_client
 for the IIO st_accel driver
Content-Language: en-US, nl
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Andi Shyti <andi.shyti@kernel.org>,
 Eric Piel <eric.piel@tremplin-utc.net>, Paul Menzel <pmenzel@molgen.mpg.de>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Dell.Client.Kernel@dell.com,
 Marius Hoch <mail@mariushoch.de>, Kai Heng Feng
 <kai.heng.feng@canonical.com>, Wolfram Sang <wsa@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20231224213629.395741-1-hdegoede@redhat.com>
 <20231224213629.395741-6-hdegoede@redhat.com>
 <20231224220321.vqzb4q3ut3dz3rl2@pali>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231224220321.vqzb4q3ut3dz3rl2@pali>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 12/24/23 23:03, Pali Rohár wrote:
> On Sunday 24 December 2023 22:36:21 Hans de Goede wrote:
>> Instead of instantiating an i2c_client for the old misc joystick emulation
>> and freefall driver: drivers/misc/lis3lv02d/lis3lv02d.c use
>> i2c_client_id-s from the IIO st_accel driver so that the accelerometer
>> gets presented to userspace as an IIO device like all modern accelerometer
>> drivers do.
>>
>> Add a new use_misc_lis3lv02d module-parameter which can be set to restore
>> the old behavior in case someone has a use-case depending on this.
>>
>> When the st_accel IIO driver is used, also pass the IRQ to the i2c_client
>> and disable the /dev/freefall chardev.
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/platform/x86/dell/dell-smo8800.c | 82 ++++++++++++++++++++++--
>>  1 file changed, 78 insertions(+), 4 deletions(-)
> 
> Sorry for the stupid question there, but what is the replacement for the
> /dev/freefall when using new st_accel IIO driver?

There is no replacement for /dev/freefall. I realize this is not ideal
and if this turns out to be a problem the default of the module option
can be reverted.

But AFAIK / AFAICT there are no actual userspace consumers of
/dev/freefall so removing it should not be an issue.

Specifically I checked smartmontools which ships smartd which
is the only daemon which I know of for hdd monitoring and
that does not have /dev/freefall support. So /dev/freefall
appears to be unused to me ?

For completeness I also checked libatasmart which also does
not access /dev/freefall.

Regards,

Hans


