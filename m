Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C599319B5BA
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jun 2024 15:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718377621; cv=none; b=hMKEImKnaif2X32NdCuyTAbUF5nNyNSg3qt0E5mN+KfHWCiCyqKI+3OJWKhv9lOgPe5Mbqg9ebWrbVPBTy1pBa879F9pdTvsmY1of0UoJm176mZwf/H20GwE7WjTR6vrdAKXnhW0dv55dji2pyzrV941ruR3Ls1Cghcsd7P6U9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718377621; c=relaxed/simple;
	bh=5ZZM7j7iL/DBgaxMjtPGC5cdDjHYV357NqZZZjsz7t8=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=DMpoWxqJSvpfY7N4KXfhNiK9hY5MIyAS8i8D8j+4N7h8RTDj9E+o7Evc23s/rf1jQRO7IHevAnhZCCKXi38lUd+3ThW9rWLWwXQaQGYpyZDTzwuHa+kWFDEnO+uIRJELqt/EGTPw1Zb7r9phK+F50a5X4br7Z1PNYeBvv3GPt+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUW+diSE; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUW+diSE"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57c75464e77so2734527a12.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jun 2024 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718377618; x=1718982418; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+pDkGRqKyAR0ML3T2V+u8oO7Ipe0KL4TQo7eIi2gH8=;
        b=HUW+diSEOGhO834X8BztFXnODpoMQbs+sl3KMugf9/+uK1eyiol1hpKgtVdYGbIh9I
         +fPu+dQDOInkre2Msay3ahIIlv+DUhJDMJPkU8ITpvpMK2IzEjZ4GOdriw4VYYC+Dqcc
         h38h6pPab5pXFHqSV7d+YLtMKoPheektQBGUPmRQVcUzkUg91XuiWsMHSra9FOOh6Bhj
         UR85LF0lepuySahnZp/6YrhBneaWSFYuueDvMtKO7Z8zay1zTgbovby0mAVd/NzWLMa6
         DtlHqJfoBH+tR8xx7li69194zq4FIGwVEpUu7srAxsAQwVpXjHZiuu3/8RWDUR6euTly
         H0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718377618; x=1718982418;
        h=content-transfer-encoding:subject:from:content-language:to
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A+pDkGRqKyAR0ML3T2V+u8oO7Ipe0KL4TQo7eIi2gH8=;
        b=F/3JksNpscKwJE24pW/oRXTUJuIafmGlFjn+XM+5S+b4wrDGJ8slJzhw+s2iOyOXLr
         JM/q4W6JnicGbJ9CrjKGtYp/ZypMffpuQ5B+E5a8o6y25BPrn/icoQ6TDbPUQpZoywzV
         RsCc8ppQNVkhNxKxnNO9d8pdsZdB63XP8TgQbJguWIIDg5tAyR3UcCVJnRh9XXRHtGAP
         WaFgdvV903NML6/hdHehh6auYFlRJ+NG8MhihO9Pd8PUle9QKxB7e+HzZHo5PH3KhzG6
         7lJFRfVmGASv57qHNEPSznEYIvos/UvdA/zMgTYIOHcABc+fPFUORMYFAjL+OwZNKK8x
         Zepw==
X-Gm-Message-State: AOJu0Yxb7OnDnTRNWqZ9XmzldgzETs5HYZvamSzaLcbZH1RZdS5UD/Xs
	aD1bXkFZP0l7NCsnOm0XagHmixcbVvqro4xKs5L4cd9UB38K3c5dmWFpyA==
X-Google-Smtp-Source: AGHT+IGZMHEArGIBHu8cUaWnaI/s2+cED2ZkQWWKUzzgWQyRL0/H7DCoIi/cw4nLRrYbQJfLvlby6A==
X-Received: by 2002:a17:906:3859:b0:a6f:2206:99ae with SMTP id a640c23a62f3a-a6f60d4144cmr215594366b.41.1718377617837;
        Fri, 14 Jun 2024 08:06:57 -0700 (PDT)
Received: from [192.168.69.3] ([91.189.216.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6f56db67e5sm193549166b.66.2024.06.14.08.06.57
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 08:06:57 -0700 (PDT)
Message-ID: <50d7eef9-17c4-4be2-bb25-37d7b74048cc@gmail.com>
Date: Fri, 14 Jun 2024 17:06:56 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: platform-driver-x86@vger.kernel.org
Content-Language: en-US, pl, pl-PL
From: =?UTF-8?Q?Micha=C5=82_Szczepaniak?= <m.szczepaniak.000@gmail.com>
Subject: [sony-laptop] Hardware keys are not properly mapped on Sony VAIO UX
 VGN-UX390N
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I have Sony VAIO VGN-UX390N and it has 3 miscellaneous buttons on the 
front. Zoom in/out and third that I'm not sure what it does. Both third 
and zoom out register as XF86Launch1 and zoom in is not being 
registered. After some looking into it, using evtest /dev/input/event5 
I've established that zoom in reports as "KEY_ZOOMIN" but because the 
keycode is above 255 it doesn't register, but from documentation I've 
established that I can remap it to XF86ZoomIn via udev.

That's all fine but both zoom out and the third button register as 
KEY_PROG1 and fixing that is not as simple as remapping so here I am 
asking for help with debugging that. I'll be fast to respond and provide 
everything that's needed.

Thanks!
