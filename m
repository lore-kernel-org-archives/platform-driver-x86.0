Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0732EACF9
	for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 21:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760391434; cv=none; b=hWxAf09DUKeA1j1q8VR00HBgah/O3Haw2qIUugZqx9IGL7LCclun1BO75alVSPN+IRf2EKFjhi6CcOIp8l9aF9/4TBM0tfneUPE2EtrGS5JhXDLuK0yAy8QfpcgAGbQl2bt91Buw3HAptG16KGfYfWRMiKJ5TcelzUagKP4QT4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760391434; c=relaxed/simple;
	bh=Hl2Anxuye8XRplAJpKbBSmfQh0rViqCT52nKsVmNPvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MtBBBRXYH0778zACdC0wXwgl7izDLOgftjT71v6zj9iYy6LnoTAyqtNzDipipNqsWSh5wqFMliLq7V+gFOPKYI64WjgqTnSncLbGgvERWYIU2psVRpOVXMRkbDaTLq1Cfh8+7bqHVjryt7CIHxqWhoHMGld0pl4EelFdXQGICAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P/rJ89GC; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P/rJ89GC"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so47815395e9.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Oct 2025 14:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760391430; x=1760996230; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NIibZ9AZHKQDiWSHleSWVU3Q4WsDJCCftwbYeVk68tk=;
        b=P/rJ89GC+1m1oydzy4+4/TJyVKjjZ37quhREDtfJS4tF/8kGHB5TYtC/HdxCLJ9AXy
         QhBRWHpqBQYU1FgCsZGn1QvI6YTF+jSFtq8+HvLmUrg4UV0pZXGnJN9pe/6RRyH+KUGb
         JlUmLeOw/1/0gJQev3KFfGXg5dKSbNcsDQJnoLeUZ+n9XFPrglldnv73KZbNpTnnbEQS
         AFTV2dD0faVjL/znIdfT1X3rlL9CURyVFI7ibCP/JcLO+EQJyCDWmxymjCsFgd09VcT4
         RE4N59LKZFQei+veIEb0FEW97ngfDNTjhvzpxR5GGCU9hiRQTbcXtAEebx1CNMkwhUj/
         HBjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760391430; x=1760996230;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NIibZ9AZHKQDiWSHleSWVU3Q4WsDJCCftwbYeVk68tk=;
        b=n6btT5REfYJiXJ1ktGVi0M7nIFYZa/NbyIDPXcYebeLIKYSgdRqU6KVcljujGGSzSV
         q0hSoupUlUeTo6/7pbDqtvFGkKpP9U/ld878w6GYx5qAcspi0LfQx4xFaEiqQ22+XLYC
         aZ9CBkyp5pZ6ETktHGK6vShAIpl/tGseK9mUGiGK+fjfT2nQNqhb+Nk3lcGjIfJMuxVb
         afAJGqPxltXfqoDkAKX8LlFeQITag3vNy6BjH1fH99b1XqqCR6qDt1TzJH9CGLzKlDZS
         KJZcxXPYq9FaJAPhGqn62ajCj9pwCimY1QJm0+WjL9cwgsF3V1azALZpFMfTdp2gmA59
         MlXw==
X-Forwarded-Encrypted: i=1; AJvYcCVgyEVXUWdE+MM08gjErG+CvEUuVFIWksxE11m1AuK9BQMvUNPyevfFWePyHzyxEdtnhcIjqd6i7sYiMNNpXJOWz/7B@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49AEAk0J92rTVStRE71PMrIhqE2Or0CExFyyOOSzxRLEKA+f0
	vbGJYReOYenufmcUWv4SdXg859HkNOIFexu6KAT9FmVjIlQmiQJRkzrVcD8CwQM4
X-Gm-Gg: ASbGnct0AkKhwVaz23BLqimfZakHz7jiW3WAN6HVFcyrtpLPnV0rBtQ0r5ecbs3Eb2W
	vANlpKNlM6fX8btsCG/Xl4fK/dH6BTz+ouoqu2cWYss0U3p9xqXnbD1Ibtt3H0d1jxehQyOu0pZ
	bw2BxL+AEdxCSVkLeTjYSTmxDVCl7RRfsVPvHiuXwnQ53rSfXp5BAk2lLswjgfeagNSGVd0eOQa
	bWLeAtBfXF7ihRpBL1tkO63tl6PNdghaIJx/ulJwzZBMcbJof43vjkYbw94/IsNhMwyWGr/HkSN
	HML9Q+Uy2KxgZnlXfYZA+ziD6Iscd7LFRXw9hQsVrhPDJsY+vnZEDRcpfpD6kg0/ecRmOBGfNuK
	6OwlSKxU1a6PzycTYMG3AU+eSMyWpiybMt2Ns6dOD8g0FbhleF1bGnf4Fs0fOA1YaXg==
X-Google-Smtp-Source: AGHT+IH1SREQLCa/Svd3IxN7xi9fuGo+yF1EqJ1MubqO02MGbIzYuC4TGh4/KXqezsvdEuSc4H2L1A==
X-Received: by 2002:a05:600c:19d0:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-46fa9b06c8cmr162443775e9.28.1760391430115;
        Mon, 13 Oct 2025 14:37:10 -0700 (PDT)
Received: from [192.168.1.121] ([176.206.100.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb489accbsm234768025e9.14.2025.10.13.14.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 14:37:09 -0700 (PDT)
Message-ID: <e6f4a811-6f70-407a-930b-f533fdefc2bf@gmail.com>
Date: Mon, 13 Oct 2025 23:37:09 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 7/7] HID: asus: add support for the asus-wmi brightness
 handler
To: Antheas Kapenekakis <lkml@antheas.dev>,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <bentiss@kernel.org>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D . Jones"
 <luke@ljones.dev>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20251013201535.6737-1-lkml@antheas.dev>
 <20251013201535.6737-8-lkml@antheas.dev>
Content-Language: en-US, it-IT, en-US-large
From: Denis Benato <benato.denis96@gmail.com>
In-Reply-To: <20251013201535.6737-8-lkml@antheas.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 10/13/25 22:15, Antheas Kapenekakis wrote:
> If the asus-wmi brightness handler is available, send the
> keyboard brightness events to it instead of passing them
> to userspace. If it is not, fall back to sending them to it.
>
> Reviewed-by: Luke D. Jones <luke@ljones.dev>
> Tested-by: Luke D. Jones <luke@ljones.dev>
> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> ---
>  drivers/hid/hid-asus.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/hid/hid-asus.c b/drivers/hid/hid-asus.c
> index 0af19c8ef035..1f904bb66396 100644
> --- a/drivers/hid/hid-asus.c
> +++ b/drivers/hid/hid-asus.c
> @@ -324,6 +324,17 @@ static int asus_event(struct hid_device *hdev, struct hid_field *field,
>  			 usage->hid & HID_USAGE);
>  	}
>  
> +	if (usage->type == EV_KEY && value) {
> +		switch (usage->code) {
> +		case KEY_KBDILLUMUP:
> +			return !asus_hid_event(ASUS_EV_BRTUP);
> +		case KEY_KBDILLUMDOWN:
> +			return !asus_hid_event(ASUS_EV_BRTDOWN);
> +		case KEY_KBDILLUMTOGGLE:
> +			return !asus_hid_event(ASUS_EV_BRTTOGGLE);
> +		}
> +	}
> +
>  	return 0;
>  }
>  
Neat. I like this.

