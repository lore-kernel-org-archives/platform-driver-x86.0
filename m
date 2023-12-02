Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VyPprd7u"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A5218C
	for <platform-driver-x86@vger.kernel.org>; Sat,  2 Dec 2023 03:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701517177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LcAmAX2K5A4mNvAqEt0EBDSFGtWFWjUHaBE+JTfDXpQ=;
	b=VyPprd7u2JFiskJ1bpRKlAP8mySB/Zb1wAI+D5IhPWlR3tovoGfRBZxVwNNqrvvrFNRGN7
	tI+FqABhxmgM/YJnj2n8CwqYVUYA8BWqX8iUUI1wJlebGxeiGOeRYkczZ0hQkMjppVGJ1f
	AWFVD0Xh/zJtFmkn37g4gVRc5FjRibk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-VvyYb9BYP3OsKYSTbH6-Qg-1; Sat, 02 Dec 2023 06:39:35 -0500
X-MC-Unique: VvyYb9BYP3OsKYSTbH6-Qg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1a4bc50361so104462966b.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 02 Dec 2023 03:39:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701517174; x=1702121974;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LcAmAX2K5A4mNvAqEt0EBDSFGtWFWjUHaBE+JTfDXpQ=;
        b=VqHd22gH7vRgODmMpk9TZWldcT7vbHVt284mktKTTkVxZ6FpskSVwKLLC6DbOTxTKE
         nsbtm5B4xLeDliu9sWx69uIA8hw7AM6H9cq3Dwt8NndpoqKnsJND50ueKRaL2uR9kgGJ
         tCNosNMF+6eoK5tL1Xlw7HayeoGBashYvmHE3gpfQJ5FmVSjhvqmDOFus5l9cnoH+tsM
         tEp1TBrsCCgzPgeaggZQvnkUGc0fcLNJClGD9WC4p+GfiZPBLsqX5Aoqd2dRSMTRq8rk
         4BY1mdXg6zVJSh6imKwyf4Tm3LBCLsFsP1TkNSpkGAMX0O0z5QaeFChKzdQI1G/2LE+Q
         edRQ==
X-Gm-Message-State: AOJu0YwGrg9jn8+SEvMz2A7yvr2/82vTgJyGD+gJIYAkvoLnoUkE803n
	fu/v9mIGSr1MYOTVYXf2hNyYWdKxoz1TUr+8GCqkyxdKCWNbaH8JV+1YTQ4eIgkXcFbnaNIaJfF
	nagLjz7PU6ecACgeeUZ/e7OzQfgZxqLnDqQ==
X-Received: by 2002:a17:906:5649:b0:a19:6d13:885e with SMTP id v9-20020a170906564900b00a196d13885emr1698536ejr.75.1701517174649;
        Sat, 02 Dec 2023 03:39:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE625CAbDMqmSxTr9k800g1xKH+6qaGZ7qd5bdgAjp7M46LaLwy0thYvjI2QSvnFKzPMrjhEA==
X-Received: by 2002:a17:906:5649:b0:a19:6d13:885e with SMTP id v9-20020a170906564900b00a196d13885emr1698530ejr.75.1701517174366;
        Sat, 02 Dec 2023 03:39:34 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id i16-20020a1709061cd000b009b2cc87b8c3sm2945128ejh.52.2023.12.02.03.39.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Dec 2023 03:39:33 -0800 (PST)
Message-ID: <dc7099d8-8b36-4399-9ea0-3d1883ac35e2@redhat.com>
Date: Sat, 2 Dec 2023 12:39:33 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/mellanox: mlxreg-lc: Check before variable
 dereferenced
Content-Language: en-US, nl
To: Vadim Pasternak <vadimp@nvidia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Yu Sun <u202112062@hust.edu.cn>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>,
 "hust-os-kernel-patches@googlegroups.com"
 <hust-os-kernel-patches@googlegroups.com>, Dongliang Mu <dzm91@hust.edu.cn>,
 Dan Carpenter <error27@gmail.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20231130094409.3963-1-u202112062@hust.edu.cn>
 <4109f017-f07c-4755-bc1b-ec4cb30b0760@suswa.mountain>
 <BN9PR12MB5381385579AF6DC7C9E63640AF82A@BN9PR12MB5381.namprd12.prod.outlook.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <BN9PR12MB5381385579AF6DC7C9E63640AF82A@BN9PR12MB5381.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/30/23 17:24, Vadim Pasternak wrote:
> Hi Dan,
> 
>> -----Original Message-----
>> From: Dan Carpenter <dan.carpenter@linaro.org>
>> Sent: Thursday, 30 November 2023 13:47
>> To: Yu Sun <u202112062@hust.edu.cn>
>> Cc: Hans de Goede <hdegoede@redhat.com>; Ilpo Järvinen
>> <ilpo.jarvinen@linux.intel.com>; Mark Gross <markgross@kernel.org>; Vadim
>> Pasternak <vadimp@nvidia.com>; hust-os-kernel-
>> patches@googlegroups.com; Dongliang Mu <dzm91@hust.edu.cn>; Dan
>> Carpenter <error27@gmail.com>; platform-driver-x86@vger.kernel.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH] platform/mellanox: mlxreg-lc: Check before variable
>> dereferenced
>>
>> On Thu, Nov 30, 2023 at 05:44:07PM +0800, Yu Sun wrote:
>>> there is a warning saying variable dereferenced before check
>>> 'data->notifier' in line 828.
>>> add "for(data->notifier)" before variable deferenced.
>>        ^^^
>> Should have been "if (data->notifier)".
>>
>>>
>>> Signed-off-by: Yu Sun <u202112062@hust.edu.cn>
>>> Reviewed-by: Dongliang Mu <dzm91@hust.edu.cn>
>>> Reviewed-by: Dan Carpenter <error27@gmail.com>
>>
>> I didn't really explicitly give a Reviewed-by tag for this patch.
>> https://groups.google.com/g/hust-os-kernel-
>> patches/c/c5hUaYIDcII/m/h4aFS7PkCQAJ
>> I also said that I thought it looked correct but that it needed a Fixes:
>> tag however the Fixes tag I suggested was wrong.
>>
>> Looking at it now, the correct Fixes tag would be:
>> Fixes: 1c8ee06b637f ("platform/mellanox: Remove unnecessary code")
>>
>> That commit says that the NULL check is not required.  So now I'm confused.
>> On the one hand, the impulse is to trust the maintainer, but on the other hand
>> my review suggested that the NULL check might be required.
> 
> Yes, it indeed required.
> My mistake.

Ok, so we are going to need a v2 of this addressing Dan's remarks
about the commit message.

Yu Sun, can you please submit a new version addressing
Dan's comments on the commit message ?

Regards,

Hans


