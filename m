Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462876F60C
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 12:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="M51B0Hkh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702902744;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AYgYG0cj/Cd+ZgeEFgRbnT6hA2o9QHquIk9uLYY3yyQ=;
	b=M51B0HkhgMnMfnbcdxUXylF4qyuHGJog5/OD0cdIlloPq+BOuOMZTGrRgTXDgTOXs77TdT
	VTvYKUHPmWjChHwHL3n9hQ9uXtAuVCQAOOgX7Zv4meodInF1BtV85djF6IV5E9y10c4Cba
	xYM8orRDjokLYi5n8sZ4ozBbi1atv+Y=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-Km6RQ-H8Of6G7Fo7aL-CtQ-1; Mon, 18 Dec 2023 07:32:22 -0500
X-MC-Unique: Km6RQ-H8Of6G7Fo7aL-CtQ-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a1f8a2945b9so155439366b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 Dec 2023 04:32:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702902741; x=1703507541;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AYgYG0cj/Cd+ZgeEFgRbnT6hA2o9QHquIk9uLYY3yyQ=;
        b=WDzlVPWHW7oG8ryg6p1J0TCc8xkhsKmpa4Kd2JSBTcpxGmkRJmi94vtP+M5udYLZBZ
         JUpCMVc8JQ4tJvodHriMH4FjbfYkqOeVaPmL3OO31T6MQj/eUwYvOznzZvMVRizy8jB9
         8RbFqxYjIwXVpsFYQZlxxhf8xxuvvXoxCqEpwJFWCDlAXxDU4C4gopTlLYG8Dt6sb9oy
         HOxjvSt2FNiE+3q7PqpTbHMQEFFVz8ihcoD/6U2dgNZBhaBFRg1pPYoB8WPoCaqByQh4
         a21lDXY1XfySnsKYtA/XttwTNL6JkCSnL9MSjh9ZedNt8Dw0uNg6H7jwZ8iZapVM5sex
         U4hQ==
X-Gm-Message-State: AOJu0Yz8taiaOs4gl/oC1NBv8v3XzVPqH/u5b3xKw5eZ+TMx+rohfFMN
	7apxLH+4O3GEYhdIRYhGv5uFKMxast3p3KVLyWvumXT2flhdxgqDhmdoc5g2AQzQK1fTn3QVQBs
	GLq1yD21gu/3grvlO303Kix0eRVrOK4CV4Q==
X-Received: by 2002:a17:906:10cc:b0:a23:6275:fc64 with SMTP id v12-20020a17090610cc00b00a236275fc64mr372593ejv.125.1702902741279;
        Mon, 18 Dec 2023 04:32:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGwg9cGU8Hv2mZ3bt0tCabzR6F79LBeQTWeEDr/kjUKFEoWDxZVEYylGYkRTNSOPNnAnNbQ2w==
X-Received: by 2002:a17:906:10cc:b0:a23:6275:fc64 with SMTP id v12-20020a17090610cc00b00a236275fc64mr372587ejv.125.1702902740946;
        Mon, 18 Dec 2023 04:32:20 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id q20-20020a17090622d400b00a2359ea1072sm1032712eja.38.2023.12.18.04.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Dec 2023 04:32:20 -0800 (PST)
Message-ID: <e07b6457-1240-474f-aa8f-a20336aaf7db@redhat.com>
Date: Mon, 18 Dec 2023 13:32:19 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] platform/x86: Move hsmp_test to probe
Content-Language: en-US
To: Suma Hegde <suma.hegde@amd.com>, platform-driver-x86@vger.kernel.org
Cc: ilpo.jarvinen@linux.intel.com,
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
References: <20231212103644.768460-1-suma.hegde@amd.com>
 <20231212103644.768460-2-suma.hegde@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231212103644.768460-2-suma.hegde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/12/23 11:36, Suma Hegde wrote:
> This is in advance to supporting ACPI based probe.
> 
> In case of non-ACPI driver, hsmp_test() can be
> performed either in plat init() or in probe().
> 
> however, in case of ACPI probing, hsmp_test() cannot
> be called in init(), as the mailbox reg offsets and
> base addresses are read from ACPI table in the probe().
> 
> Hence, move hsmp_test() to probe as preparation for
> ACPI support.
> 
> Also use hsmp_send_message() directly in hsmp_test()
> as the semaphore is already initialized in probe.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Co-developed-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> ---
>  drivers/platform/x86/amd/hsmp.c | 30 +++++++++++-------------------
>  1 file changed, 11 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/hsmp.c b/drivers/platform/x86/amd/hsmp.c
> index b55d80e29139..3c17b488f4f8 100644
> --- a/drivers/platform/x86/amd/hsmp.c
> +++ b/drivers/platform/x86/amd/hsmp.c
> @@ -244,12 +244,7 @@ EXPORT_SYMBOL_GPL(hsmp_send_message);
>  static int hsmp_test(u16 sock_ind, u32 value)
>  {
>  	struct hsmp_message msg = { 0 };
> -	struct amd_northbridge *nb;
> -	int ret = -ENODEV;
> -
> -	nb = node_to_amd_nb(sock_ind);
> -	if (!nb || !nb->root)
> -		return ret;
> +	int ret;
>  
>  	/*
>  	 * Test the hsmp port by performing TEST command. The test message
> @@ -261,7 +256,7 @@ static int hsmp_test(u16 sock_ind, u32 value)
>  	msg.args[0]	= value;
>  	msg.sock_ind	= sock_ind;
>  
> -	ret = __hsmp_send_message(nb->root, &msg);
> +	ret = hsmp_send_message(&msg);
>  	if (ret)
>  		return ret;
>  
> @@ -504,6 +499,15 @@ static int hsmp_pltdrv_probe(struct platform_device *pdev)
>  	for (i = 0; i < plat_dev.num_sockets; i++) {
>  		sema_init(&plat_dev.sock[i].hsmp_sem, 1);
>  		plat_dev.sock[i].sock_ind = i;
> +
> +		/* Test the hsmp interface on each socket */
> +		ret = hsmp_test(i, 0xDEADBEEF);
> +		if (ret) {
> +			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> +			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			pr_err("Is HSMP disabled in BIOS ?\n");
> +			return ret;
> +		}
>  	}
>  
>  	plat_dev.hsmp_device.name	= HSMP_CDEV_NAME;
> @@ -544,7 +548,6 @@ static struct platform_device *amd_hsmp_platdev;
>  static int __init hsmp_plt_init(void)
>  {
>  	int ret = -ENODEV;
> -	int i;
>  
>  	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
>  		pr_err("HSMP is not supported on Family:%x model:%x\n",
> @@ -560,17 +563,6 @@ static int __init hsmp_plt_init(void)
>  	if (plat_dev.num_sockets == 0)
>  		return ret;
>  
> -	/* Test the hsmp interface on each socket */
> -	for (i = 0; i < plat_dev.num_sockets; i++) {
> -		ret = hsmp_test(i, 0xDEADBEEF);
> -		if (ret) {
> -			pr_err("HSMP test message failed on Fam:%x model:%x\n",
> -			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> -			pr_err("Is HSMP disabled in BIOS ?\n");
> -			return ret;
> -		}
> -	}
> -
>  	ret = platform_driver_register(&amd_hsmp_driver);
>  	if (ret)
>  		return ret;

