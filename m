Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48FA623754
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 09:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714383261; cv=none; b=erVl3lw32ZsaGwN7npvcwShxtZK+KRrmt5MacAW45RZ45c2TnBskZPLes4cpZRpYNTwFG+AJZyn5YP9Cct1W6iwVIyjyeVUL+z9ovbmhsfdiLq6Uo/r3r+LOpWenDk7fbuki9qfFXRIuoesh6PQDL7nUXRBFmsD4ZuH74HJWj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714383261; c=relaxed/simple;
	bh=m5ksx5lHlSGbP4Mb8aTtdzQSTAiG0bMq4Di6nqWA3i4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DMovTFiHi2fKG4jXbaCU4igsqub65F45rF1qaEY9G94Xt3xAknagzt9+RpfHD4wK+Nv51WcKZE9uMbWMQzkQvtQhvnPspwFLOZRuyM5/mqkBPvjkHxWpF3VD3gocF3yhgI4zpDsWS4BpNvlCdehcy39SGYBVpz7PanvCuDQP6e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WVYTcj4x; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WVYTcj4x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714383259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=meycXuX8e7UgXDDzdpk2z7uxIbEyQo1uGtZkZvT27vY=;
	b=WVYTcj4xTgWYdibZ6R2uBp8Hqdis30AoRqMCOYvbT7AskJ3roXSXdu+hS6llK8qp8VM9Un
	wNkMkGzlw6EPeoNGk3Zv/hlh3dzn7D4X7Vvuwuf5q43pIvp9a9B0DcsjV9tmK9e7znsXdd
	RDKsYx+OgpuER7awRQmBpuHNNTO484c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-2-aiVXYGZ_OliQVtwvCewk-Q-1; Mon, 29 Apr 2024 05:34:17 -0400
X-MC-Unique: aiVXYGZ_OliQVtwvCewk-Q-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a5872678bd2so228167666b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Apr 2024 02:34:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714383256; x=1714988056;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=meycXuX8e7UgXDDzdpk2z7uxIbEyQo1uGtZkZvT27vY=;
        b=j/qIk5a6lo4tplyFDwLEpD9O/MCuFCnYmPZOT2hexj0FhWJ5e3ghZ7YEX2ofsjyg3C
         vAoTDHxf9iKEXnStrN883caezkOEzcEj/29P7UX2jSDslc6TjiKt1BR9xs/8TQvqY4zj
         2dUZZkIhVBJyYzm/4xeBrEUzNl2FnBUO+DMtSA1QN+7GANJmqMENe+bULQFRDiOTomFm
         KGoQuADaiyJgcQVyrdHDnZTNoEcAElH6QjRzM/wUBu+uqKkDSzvm1bbXm6CE8l7/u5Gn
         ts9DehAhy/q3fUHGsYd6NvbsHUVgcpPXC3JQD3Xq/DbFo+fbmaoWAz4ivYwO6H7/TD+V
         Nj7A==
X-Forwarded-Encrypted: i=1; AJvYcCUVopLTozqovdAvKHQkhkVQT+SJj0aE+ZFTB4/gn/8RB4WZOU8RTToPKDUuPlEtQ7s1BmQocP6w0Nx1TwP7UbBV+dH4GBg3vLFHL88HA7HxjH+mXg==
X-Gm-Message-State: AOJu0YyGNMRh6+t4W7ldIdqfxpQtrtSDLQe4zr7UlVmcqRpGYiyYU83o
	cqGw9GSkJpZsiUHKnC+91da1JhDq6wE4m8vdiwtGcRt/CSK0SPylN2YrtEbaT41ZibKmPJm18RP
	4NGAMY7+Nu+x6LW8VYp7RNrOW+GXg27yZ+G6BG71Ylv95hBHy8yEF1+LJRK4XgO5MXeYhzqc=
X-Received: by 2002:a17:906:3a85:b0:a55:b272:ea02 with SMTP id y5-20020a1709063a8500b00a55b272ea02mr5792057ejd.75.1714383255902;
        Mon, 29 Apr 2024 02:34:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqN/9IkuYOVYfHTH3NBJCK5ck7Pl+9M6Kqc/Z+v9QNl2sCdU5MJ29JHL0EIlO1K7jyR+0ipQ==
X-Received: by 2002:a17:906:3a85:b0:a55:b272:ea02 with SMTP id y5-20020a1709063a8500b00a55b272ea02mr5792036ejd.75.1714383255541;
        Mon, 29 Apr 2024 02:34:15 -0700 (PDT)
Received: from [10.40.98.157] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id d18-20020a1709061f5200b00a587831c09fsm7711900ejk.186.2024.04.29.02.34.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Apr 2024 02:34:15 -0700 (PDT)
Message-ID: <4ea9a2ae-78d3-4ae1-b63a-1b8ac50ce532@redhat.com>
Date: Mon, 29 Apr 2024 11:34:13 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/24] platform/x86: thinkpad_acpi: Drop ignore_acpi_ev
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andy@kernel.org>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
 Vishnu Sankar <vishnuocv@gmail.com>, Nitin Joshi <njoshi1@lenovo.com>,
 ibm-acpi-devel@lists.sourceforge.net, platform-driver-x86@vger.kernel.org
References: <20240424122834.19801-1-hdegoede@redhat.com>
 <20240424122834.19801-5-hdegoede@redhat.com>
 <a8743812-0df6-e916-1272-657bbfa39892@linux.intel.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <a8743812-0df6-e916-1272-657bbfa39892@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

On 4/25/24 9:13 AM, Ilpo Järvinen wrote:
> On Wed, 24 Apr 2024, Hans de Goede wrote:
> 
>> Setting ignore_acpi_ev to true has the same result as setting
>> send_acpi_ev to false, so there is no need to have both.
>>
>> Drop ignore_acpi_ev.
>>
>> Tested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> Not directly related to this patch but while reviewing it I noticed 
> this which should be converted to false:
> 
> 	send_acpi_ev = 0;

Right I noticed that too, but I decided it would be best to fix that
in a separate patch and then forgot about it.

Let me send a patch to address this right away.

Regards,

Hans

