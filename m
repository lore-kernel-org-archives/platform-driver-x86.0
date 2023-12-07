Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JOgzgOcz"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE45210F9
	for <platform-driver-x86@vger.kernel.org>; Thu,  7 Dec 2023 09:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701970778;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0Ws7m9/VGMY9jA2Zm8H2GzaVlf6J6UjM2ENOcSbcWE=;
	b=JOgzgOczpOHRyu8Sf/gfFzaZmvok5OMfeHah2saCp/OiTpsRxwaOjiocFXqJbWequA4WGb
	fiYInpU3roDdafciBcaxwpKOuAl8642gR92molOyVKi7mV/aHigK793jYc5Qp/YibV6Ecl
	GMqP02J3kFOMYS7sIuyJgHsYbyrk01s=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-wLb3QL77NmGb_TMx3edhmg-1; Thu, 07 Dec 2023 12:39:35 -0500
X-MC-Unique: wLb3QL77NmGb_TMx3edhmg-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1848bc49f6so66728566b.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 Dec 2023 09:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701970774; x=1702575574;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0Ws7m9/VGMY9jA2Zm8H2GzaVlf6J6UjM2ENOcSbcWE=;
        b=simJ8W+ErLGtOToPwZZxKglsAueBOmvur0j3bM6UkN/L67i7ng/ARbqESondYDCU9C
         rUyZJY2DA+yKmGa5JxiQu1ZxFuf8lVL1Jn1f0XP6vkPsvDxxp4UZJp7xqBIAw58p291X
         0bmw1iLdET08EpBJxXFSu2uU+dZc6m/S3aORnpd1hTFSdwDL+haFM2QHMOyRm9LAnfS9
         mU1PJjDRIddu6tk5x1OnaRcHmgFgyYjJHUSsVuNTm9BrzCJ5/ViwyswvYCcU56cDR+vj
         2TUSgX143a9cwpg9WmxrBysubF8up7Sisr2YsfBht4lH7nMsCELGP65Ov/04lgXXFvvz
         KMlQ==
X-Gm-Message-State: AOJu0YxS2M3xmdQmNorciezyyDoeEvcWLFNb2ch8vUdDe3olB9csxmYD
	AFzmbqA5QN0OECDr3NABPQ/AKkCFPXW5k82u2cpxa/ezJJDmLAFLXeA0wRG9m+id9RDkxGBSRuL
	UgtNFB0fX3e8S56lCo0GghXNn9x68SMAq19Rdo5I0OQ==
X-Received: by 2002:a17:906:1009:b0:a1e:ef3d:7b70 with SMTP id 9-20020a170906100900b00a1eef3d7b70mr738603ejm.103.1701970774333;
        Thu, 07 Dec 2023 09:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFCVL0gRull1E4OV117OC9Mjn3PZRJ7pSlqY2/B58XXHx4ByQK4jvicylVrGun0S3c31fmGQw==
X-Received: by 2002:a17:906:1009:b0:a1e:ef3d:7b70 with SMTP id 9-20020a170906100900b00a1eef3d7b70mr738600ejm.103.1701970774017;
        Thu, 07 Dec 2023 09:39:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ub26-20020a170907c81a00b00a1c96e987c4sm10520ejc.101.2023.12.07.09.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Dec 2023 09:39:33 -0800 (PST)
Message-ID: <3deb876a-62f5-44b9-a20c-ff57bd6ceea9@redhat.com>
Date: Thu, 7 Dec 2023 18:39:32 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: Add intel_bytcrc_pwrsrc driver
Content-Language: en-US, nl
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: platform-driver-x86@vger.kernel.org
References: <20230303221928.285477-1-hdegoede@redhat.com>
 <CAHp75VfOUnVVr=_VcTch4-=KTv6v5yG3g+adgn2CtnjKCV0YYw@mail.gmail.com>
 <68a17e4e-a9ee-fe8b-abcd-7ccb4932e72a@redhat.com>
 <ZKvOEXaS6OElB0Tq@smile.fi.intel.com> <ZXHtzpgCks1Ix-0o@smile.fi.intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZXHtzpgCks1Ix-0o@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andy,

On 12/7/23 17:07, Andy Shevchenko wrote:

>>  Table 5-51: Wake Source Register
>>  Register Name R/W D7 D6 D5 D4 D3 D2 D1 D0 Initial Address
>>  WAKESRC R RSVD WAKE WAKU WAKE WAKE 0X00 TBD
>> 		ADPT SB BAT PBTN
>>  BIT NAME FUNCTION DEFAULT
>>  D[7:4]	  Reserved
>>  		  Reserved
>>  0
>>  D[3]	  WAKEADPT
>>  		  0 = No wake by an AC/DC adapter insertion
>>  		  1 = Wake was triggered by an AC/DC adapter
>>  		  insertion.
>>  0
>>  D[2]	  WAKEUSB
>>  		  0 = No wake by a USB charger insertion
>>  		  1 = Wake was triggered by a USB charger insertion.
>>  0
>>  D[1]	  WAKEBAT
>>  		  0 = No wake by a battery insertion
>>  		  1 = Wake was triggered by a battery insertion.
>>  0
>>  D[0]	  WAKEPBTN
>>  		  0 = No wake by user pressing the power button
>>  		  1 = Wake was triggered by user pressing the power
>>  		  button.
>>  0
> 
> Did it help anyhow?

Thank you for digging this up, this confirms the bit
definitions we already have from one of the Android
kernel trees. It is good to have those confirmed.

Regards,

Hans




