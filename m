Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A19966A008
	for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708262729; cv=none; b=bzPz1WObAHbJP/n24r/6cQlCVuOQSb26tWhCef0JX9CEPi5Ou2SMe5DbadZrnHN5qFVGxbaejSZ0NDe8wXlIM6kL4LEdoMvJKpzg6vsNB/cZJq85gCe6+s4OO384BqE4CAfgO09opg9EiVyr/pAD2x0yR7Dn8wJHfJFhxw0pVto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708262729; c=relaxed/simple;
	bh=P4ML14XHuu8iY5wsuV38ICM6bwGJD+WkS9vw0ZARwP4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R5hDW4evesxAgqHN7YhudZJXDm9R8FzOso9f7oNjpw6J8qV4lwmXvYEEkDUrcnIUrSSClshDws0V0yrDtM+7+bstmOa8fl131UQr+omW37xkWrGOkIr9x27v7mGPd8p4mmPQ/LiYJ9Jq/XaJTi0hlfQH+gv+TGeQy4/LmBxrAWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fv9aJJ+o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fv9aJJ+o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708262726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wRyqbWDhpXDn/kZw2NZB3K/o5FJXowP6pyH8OpnwzS4=;
	b=fv9aJJ+oxdiCBUzBlUZObSg+JjT0oCqmuphcysBa+q0TRzUfrsX1HBPTQEPArKTcMBrt6K
	BXYVwGKKLDHa3DlNNNj5niPEr+0kH77CE64qkcQAkTk2J6wBiZENnXyVmWoh8oRpJ9SIjn
	TDda+EsZ3gKA9biIZxBxZMpM8Wq8ZIE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-J4SxWhfoNGa-n-enoyIMnw-1; Sun, 18 Feb 2024 08:25:24 -0500
X-MC-Unique: J4SxWhfoNGa-n-enoyIMnw-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-512a9c0c05cso622836e87.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 18 Feb 2024 05:25:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708262723; x=1708867523;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wRyqbWDhpXDn/kZw2NZB3K/o5FJXowP6pyH8OpnwzS4=;
        b=F9qQXWkoZkuDeYZmzNyC+anpS0apBSI1kNNzmgkGYm22zWik7p8vHQvVP1reLtSMQH
         GYC057oaCsozoKE5qAOPAFolMFQLIrWTq57PstydRO2YxHskKEWCJT8LDilM4KesH0nd
         6o2kNVnT3AlQiQrAiHqO38Xa+UA+xxufjAb6X2+zU6YpShxG8P2JieD6F04YguKNxntV
         hYp/iQCwk1WEguiJS/SEB4k81bW/BYHp6DxrOwD5gFVrwiEsWqJsHkr4Dp6IJX1oMHyA
         u5uhPOF90tOZiBzxMYdhTJMjha2gpOyt0Mgjxb2NnhIgjQbxMhV+XSWEZQiNBxIdApBd
         Py6w==
X-Forwarded-Encrypted: i=1; AJvYcCVsbsO0Gu1W5GhVa/1sIR+HoJe8OHf7bVctFdeYt9WBmHG0wlonIrkmQRAjtwOmQq95ZfCyrOqHqcibGNobubOcbBACr4gvcCySGH46csCvSP8Kyw==
X-Gm-Message-State: AOJu0YxRg68MK+a/WSLGdAQEgt/Q+lImm1+S9hw487uoaBv6Uh8I/cwX
	enbjhObS0bn9FANRsES1DME5gLVGQ00JW4uyZ/Ivl4u5byIe6HcW4LO0FJuTDKiAxzqtVJoQ1uO
	ZVxzYP0/u7lhuTa/EEkV7b2POjYDUryx1pMKbaIU8cYUyBa1Ll2gNcKMfa609rDyw4ZLWTJ8=
X-Received: by 2002:ac2:551c:0:b0:512:a785:53b with SMTP id j28-20020ac2551c000000b00512a785053bmr1754910lfk.46.1708262723263;
        Sun, 18 Feb 2024 05:25:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDmcPk5TBHijYDtMsIBPz2impyiCbvARg/76g6vJQ4+u6M9CmA68JT9u5J8Jewlb83y1wd7w==
X-Received: by 2002:ac2:551c:0:b0:512:a785:53b with SMTP id j28-20020ac2551c000000b00512a785053bmr1754904lfk.46.1708262722924;
        Sun, 18 Feb 2024 05:25:22 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m12-20020a170906160c00b00a3d0a094574sm1930615ejd.66.2024.02.18.05.25.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Feb 2024 05:25:22 -0800 (PST)
Message-ID: <002d6e55-0b46-435c-905c-20b4da04d061@redhat.com>
Date: Sun, 18 Feb 2024 14:25:21 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] platform/x86: Add new get_serdev_controller() helper
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org, Tony Lindgren <tony@atomide.com>
References: <20240216201721.239791-1-hdegoede@redhat.com>
 <20240216201721.239791-3-hdegoede@redhat.com>
 <Zc_Sf73kfss-c2TD@smile.fi.intel.com>
 <774d159d-0822-4205-b214-95ffab03a988@redhat.com>
 <CAHp75Vf96z1HGWK9_tY=USAvJ-aJxAFv2cTjCAd3tkxe-ndd1g@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf96z1HGWK9_tY=USAvJ-aJxAFv2cTjCAd3tkxe-ndd1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andy,

On 2/17/24 19:09, Andy Shevchenko wrote:
> On Sat, Feb 17, 2024 at 12:36 AM Hans de Goede <hdegoede@redhat.com> wrote:
>> On 2/16/24 22:24, Andy Shevchenko wrote:
>>> On Fri, Feb 16, 2024 at 09:17:19PM +0100, Hans de Goede wrote:
> 
> ...
> 
>>> The above doesn't explain why the new code is h-file.
>>
>> It is in a h file because as metioned: "another driver is in the works"
>> which will also need this.
> 
> Implied, but quite unclear. Can you rephrase?

Ack will do and I'll also add the missing headers which
you pointed out.

Regards,

Hans


