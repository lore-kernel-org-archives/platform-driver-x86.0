Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hp8atEVf"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4F0CD71
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Nov 2023 05:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1700831516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MPPhtCNnqzbt2j0R0uiWYEykaIDTGoSkkICfezjLrTA=;
	b=hp8atEVfWL18w2Lsv94N3vRY6YM+tdyNBFTOtlrE8N5F8qBhumEUd/NOm0mHXdri/r7ZpO
	ovKTvrAzjUaip07w8fUSUUg4eK9GekuMBpTBvkkqvHuKT44iOCijFM4QdO/PmIkBfaS+N/
	UcMsQXeEpG/Vxt/ApiLhaYdWEY81LjY=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-Bv5Dl0azPNSgamybZxAjsg-1; Fri, 24 Nov 2023 08:11:55 -0500
X-MC-Unique: Bv5Dl0azPNSgamybZxAjsg-1
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2c50255b905so16946911fa.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Nov 2023 05:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700831513; x=1701436313;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MPPhtCNnqzbt2j0R0uiWYEykaIDTGoSkkICfezjLrTA=;
        b=kMoBwI87F8AUeWdhxVsgx/2pFrvsDNMSLMvxaneJ/jnbRmpQY2c2sfvr8yJ3KBjH6s
         qwpO2R1nfMUms8AMGRL2RqgZlwJiCL+plFEAc3RXIoe65WOOpQ+D840KddFOAWN1r30L
         g86o/ZB9xBirluWQPNXmb9UWY0aoE4kv3JqoNTIcJnDbflimMdhRJGIerOMl/vZrQVXB
         ZIhvNssAu+1ZvDq9WmlVfUB8862JLskKq/iFwfRQeGrJ6sbfu3NTxJZ4c0URem9QuFcW
         iefyO0aDK4F++VM27Wpx9uAugF5BJ4QEZJXT0bryEQW6D4XVq3mRLSz1vOEoCk4lZrhU
         VhgA==
X-Gm-Message-State: AOJu0YxFgQmtGCk9L+8gxDiMXmFVrfbZlSSwrDKCiUM29WZHcfMGSLJw
	+M842q181d2Qzo1Qimqd3fo8ulmT5JhkrYpb6lwMppy1A1Gzwe7OQn93rtevkd7py6Hb6xcSti4
	JPyzsJgG3Y+La2+L/ToTfg/8GHz9q8Yw7T1aCJDwDAg==
X-Received: by 2002:a05:6512:1386:b0:507:a9b7:f071 with SMTP id fc6-20020a056512138600b00507a9b7f071mr2789943lfb.1.1700831513578;
        Fri, 24 Nov 2023 05:11:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUrNvhzUJJH6IXHaVhfocTRxPCIW55Lhxa2/cOjOcb60XMHNOMfLTXzTJts714W7TDGb9+cw==
X-Received: by 2002:a05:6512:1386:b0:507:a9b7:f071 with SMTP id fc6-20020a056512138600b00507a9b7f071mr2789890lfb.1.1700831512948;
        Fri, 24 Nov 2023 05:11:52 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id q22-20020a170906361600b00a0290da4a50sm2039509ejb.186.2023.11.24.05.11.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 05:11:52 -0800 (PST)
Message-ID: <601025b8-22d4-4d86-9457-e7f8c4af798e@redhat.com>
Date: Fri, 24 Nov 2023 14:11:51 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] platform/x86: asus-wmi: Filter Volume key presses if
 also reported via atkbd
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Kai Heng Feng <kai.heng.feng@canonical.com>,
 acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20231120154235.610808-1-hdegoede@redhat.com>
 <f7b5df27-497b-de99-35e2-913a1640b48d@linux.intel.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f7b5df27-497b-de99-35e2-913a1640b48d@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 11/23/23 13:41, Ilpo Järvinen wrote:
> On Mon, 20 Nov 2023, Hans de Goede wrote:
> 
>> An issue where volume keypresses get reported through both the atkbd
>> and the asus-wmi interface has been reported here:
>>
>> https://bbs.archlinux.org/viewtopic.php?pid=2128536#p2128536
>>
>> This series addresses this. Unfortunately the reporter has fallen
>> quiet and has not confirmed that this fixes things, but the fix
>> is straight forward enough that there should be little doubt
>> that it works.
>>
>> Ilpo, the first patch in this series is a straight forward bugfix,
>> can you merge this into the fixes branch ?
>>
>> I guess the rest of the series is a bugfix too, but since this
>> is untested I'm not sure what to do wrt fixes vs for-next,
>> what do you think ?
> 
> I just took them all into review-ilpo and will propagate them to fixes.
> I don't think putting them into for-next wins that much here.

Ok, sounds good. Thank you.

Regards,

Hans



