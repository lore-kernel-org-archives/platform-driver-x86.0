Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E903A373
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 14:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hPItcqS9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702909911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+ztkbzForDIbdF8kx2pZOTb+CaqeIpnR/mS2NaJZXZw=;
	b=hPItcqS90BYosrmr/ABOKsWkqDBTDmClKRiF3WhQmi0k2BJ1X4IiwxmipwsJiYCiPaoivv
	GmL7/2ldCcJb4Ti5rx6VR65O9ZZpDVayJJcyF0h+xnKpQogOl+XZg17GtrPsJ9GDKR+1Ag
	r9izSqtzizXo8/guzAsdTy8U/FxmgkA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-IyjzJxB9MuKMUykuw8YUGA-1; Mon, 18 Dec 2023 09:31:49 -0500
X-MC-Unique: IyjzJxB9MuKMUykuw8YUGA-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-a00dd93a5f9so185781566b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 06:31:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702909908; x=1703514708;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ztkbzForDIbdF8kx2pZOTb+CaqeIpnR/mS2NaJZXZw=;
        b=AD69btAAPx/qLIajB5lbNEpmS+IGTv+RSdGJS5luxJX6zbzRKNzj3SSdgPUlQR4ra6
         JJIYcA81azsZ+6P3K94s0M720JN2TXK1q5Cv2AqVtJC/N1khg5qvDyQZuKcwkhzHemVh
         zDhmti4vdsIbSCgN1CiMoqW1OlvWLLMMrRSx1YiDRplQyP8yXeXbcnkLdOJPfAxelZa7
         1yZ7aMHl59nxWYEuWGcQxZfSmn7UOEY38Avhi6uqDwco0/LiEWpdkulVGpOza7TR0hJs
         tkx4gvQGOykfiaSpasIhFVJIX+kFSj2iFKxVpOfQchI669miXc+hatsfsWXns6DVXNVO
         fq9g==
X-Gm-Message-State: AOJu0YxOwLn53wh8JJwrL3L24XWb/6suGKfN/QJG5rBr2uJwfvLVyPaB
	vlYoAz8cxBiqm4Ky/2L1ouo1Rccghz0bdmh89Kr/AJCHWQINeouTygDYJCUz1COiy42VluE1wRj
	WUC2zksuSQwZWaNyoGidk0qvPvVfiPqcnXQ==
X-Received: by 2002:a17:906:799:b0:a23:5ce0:d953 with SMTP id l25-20020a170906079900b00a235ce0d953mr336776ejc.184.1702909907943;
        Mon, 18 Dec 2023 06:31:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGj7DfijjLkX7XIgW8jwsFcTcR6VQeIWTM/xejB3nQqk2hqOQ7BF+tJBU+V1IZep8I91ky65w==
X-Received: by 2002:a17:906:799:b0:a23:5ce0:d953 with SMTP id l25-20020a170906079900b00a235ce0d953mr336770ejc.184.1702909907558;
        Mon, 18 Dec 2023 06:31:47 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id tb21-20020a1709078b9500b009ad89697c86sm14377558ejc.144.2023.12.18.06.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 06:31:46 -0800 (PST)
Message-ID: <ad47d15f-74fc-4f59-bdd9-ac36dc95bdff@redhat.com>
Date: Mon, 18 Dec 2023 15:31:45 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] platform/x86: wmi: ACPI improvements
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20231216015601.395118-1-W_Armin@gmx.de>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231216015601.395118-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Armin,

On 12/16/23 02:55, Armin Wolf wrote:
> This patch series improves the ACPI handling inside the ACPI WMI driver.
> The first patch removes an unused variable, while the second patch
> changes the order in which the ACPI handlers are removed on shutdown.
> The third patch simplifies the error handling during probe by using
> devres to manage devie resources, while the next two patches decouple
> the ACPI notify handler from the wmi_block_list. The last patch
> simplifies yet another ACPI-related function.
> 
> All patches have been tested on a Dell Inspiron 3505 and appear to work.
> 
> Armin Wolf (6):
>   platform/x86: wmi: Remove unused variable in address space handler
>   platform/x86: wmi: Remove ACPI handlers after WMI devices
>   platform/x86: wmi: Use devres for resource handling
>   platform/x86: wmi: Create WMI bus device first
>   platform/x86: wmi: Decouple ACPI notify handler from wmi_block_list
>   platform/x86: wmi: Simplify get_subobj_info()
> 
>  drivers/platform/x86/wmi.c | 143 ++++++++++++++++++-------------------
>  1 file changed, 71 insertions(+), 72 deletions(-)

Thank you for the series, with the exception of the one small remark
to patch 3/7 the entire series looks good to me.

With that remark addressed you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

to the series.

Regards,

Hans

> 
> --
> 2.39.2
> 

