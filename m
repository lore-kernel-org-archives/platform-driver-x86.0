Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CFE7C77B77
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Apr 2023 10:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjDOKNN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 15 Apr 2023 06:13:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60134 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229847AbjDOKNB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 15 Apr 2023 06:13:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B09673C1E
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Apr 2023 03:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681553536;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=TQeirBygBhnh/bgPm8jyimdCuEwxK1b4oZ0S14iOIr8=;
        b=PXW7ne8IsPEEGPiYjr84kysPzbcHbAQEQ4NIyge43fhMYiZd7Bnh18b0avndg+QBiPQcLQ
        0hNmqaNDOiO8FZUv3bJ9gszjMUwvAFxEVRMViJnBXEvY0ociOyIwDLK6odO5cfJlz6anwg
        zgcnLezYyYcf+cuslVw1//c6o9X4xSM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-339-ntSo2i8uOmO_NtsroBQRsw-1; Sat, 15 Apr 2023 06:12:14 -0400
X-MC-Unique: ntSo2i8uOmO_NtsroBQRsw-1
Received: by mail-ed1-f69.google.com with SMTP id q19-20020a50c353000000b0050683052191so2276708edb.19
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Apr 2023 03:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681553534; x=1684145534;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQeirBygBhnh/bgPm8jyimdCuEwxK1b4oZ0S14iOIr8=;
        b=jqmpSY/2BXThWtS0waVtKd6gqdlD7db1picbN3c801Heb7/fOeWCujgWkonMgZJmHC
         7nX77xXJP7U2D5hrvig7R70c3mopQ3EDKbDhTdjbO4f/nRuFh1nNIFa5M7F1QsxtVgaU
         /uiYkxwAAGpJQ5IjJ/xEb1tUzBIU5i1+yWYLYxZNM9LRVeimKuOTtjS0YiJWOUo4JNvI
         rXKF9kvWgtsyjEKSBNVP41g8dq+YpycT2I3BkafZ4E2X2KQf8DAwOwTc4QOV1xPGe6v1
         kixBq+O8lCwkaMGgkM/FIPmgrkhJCj9yEZE7dqHJyqrFi4cle5VaNUV8o1dg3Hz4wdrm
         H+MQ==
X-Gm-Message-State: AAQBX9cHw3nTBgj1t7k3qFqKJN/7dc0i7dgFyGmx0RsqmvR7zMAnWY76
        YzopknoAzZ39jXgbVv+FY4XkyYKKOHAz07sk8JbXxuEfCd5KvsC0Uqv5zaRw28t9Kn5EBnvGRBE
        0tZR6wYNlkfq9T33LWtk7mzSYCfwxoNL6sQ==
X-Received: by 2002:a17:906:3ac7:b0:94a:5819:5a24 with SMTP id z7-20020a1709063ac700b0094a58195a24mr1770119ejd.18.1681553533905;
        Sat, 15 Apr 2023 03:12:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350YusHoo6gFVnpQm9KF88p/O/d5jPexaF7AcZIqORigpf2xuxV4feGwJcL2yrZUgRKevX6hCXQ==
X-Received: by 2002:a17:906:3ac7:b0:94a:5819:5a24 with SMTP id z7-20020a1709063ac700b0094a58195a24mr1770099ejd.18.1681553533559;
        Sat, 15 Apr 2023 03:12:13 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gv35-20020a1709072be300b0094f07545d43sm1066677ejc.188.2023.04.15.03.12.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Apr 2023 03:12:12 -0700 (PDT)
Message-ID: <060c750b-f282-b1f4-2fcc-64fc3885f149@redhat.com>
Date:   Sat, 15 Apr 2023 12:12:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Fix Embedded Controller
 access on X380 Yoga
Content-Language: en-US, nl
To:     Daniel Bertalan <dani@danielbertalan.dev>,
        Mark Gross <markgross@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, liavalb@gmail.com
References: <20230414180034.63914-1-dani@danielbertalan.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230414180034.63914-1-dani@danielbertalan.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/14/23 20:02, Daniel Bertalan wrote:
> On the X380 Yoga, the `ECRD` and `ECWR` ACPI objects cannot be used for
> accessing the Embedded Controller: instead of a method that reads from
> the EC's memory, `ECRD` is the name of a location in high memory. This
> meant that trying to call them would fail with the following message:
> 
>   ACPI: \_SB.PCI0.LPCB.EC.ECRD: 1 arguments were passed to a non-method
>   ACPI object (RegionField)
> 
> With this commit, it is now possible to access the EC and read
> temperature and fan speed information. Note that while writes to the
> HFSP register do go through (as indicated by subsequent reads showing
> the new value), the fan does not actually change its speed.
> 
> Signed-off-by: Daniel Bertalan <dani@danielbertalan.dev>

Interestig, this looks like a pretty clean solution to me.

Mark Pearson, do you have any remarks on this ?

Regards,

Hans


> ---
>  drivers/platform/x86/thinkpad_acpi.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 7191ff2625b1..6fe82f805ea8 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -11699,6 +11699,7 @@ static int __init thinkpad_acpi_module_init(void)
>  {
>  	const struct dmi_system_id *dmi_id;
>  	int ret, i;
> +	acpi_object_type obj_type;
>  
>  	tpacpi_lifecycle = TPACPI_LIFE_INIT;
>  
> @@ -11724,6 +11725,21 @@ static int __init thinkpad_acpi_module_init(void)
>  	TPACPI_ACPIHANDLE_INIT(ecrd);
>  	TPACPI_ACPIHANDLE_INIT(ecwr);
>  
> +	/*
> +	 * Quirk: in some models (e.g. X380 Yoga), an object named ECRD
> +	 * exists, but it is a register, not a method.
> +	 */
> +	if (ecrd_handle) {
> +		acpi_get_type(ecrd_handle, &obj_type);
> +		if (obj_type != ACPI_TYPE_METHOD)
> +			ecrd_handle = NULL;
> +	}
> +	if (ecwr_handle) {
> +		acpi_get_type(ecwr_handle, &obj_type);
> +		if (obj_type != ACPI_TYPE_METHOD)
> +			ecwr_handle = NULL;
> +	}
> +
>  	tpacpi_wq = create_singlethread_workqueue(TPACPI_WORKQUEUE_NAME);
>  	if (!tpacpi_wq) {
>  		thinkpad_acpi_module_exit();

