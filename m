Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F1A8C433EF
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:23:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87AA860FDA
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Sep 2021 09:23:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238504AbhIMJYp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Sep 2021 05:24:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51623 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238439AbhIMJYo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 05:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631525009;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=9l0P5V3vonosFFJIQDtSd7XQpJ9Yj7ROYWAG0DyJcmo=;
        b=MzFE3dtbpnvz1UhH6VK4y1j2pNHUFyaP9YKucyJw8LxaIyjEG6jk8uSc8m5L+An4rzhNgP
        vkWbQA3678IO1vUxn9P4v/pUGRm3/CQ1G5JUhdySHBMmJ9UhwsS69uiRrrYZh1MXWaZi+A
        KhvSSYOSs8Tlqdxm7h0w/qYPErifhI0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-3LUxLVSZMCSztR91PuSWcA-1; Mon, 13 Sep 2021 05:23:28 -0400
X-MC-Unique: 3LUxLVSZMCSztR91PuSWcA-1
Received: by mail-ed1-f69.google.com with SMTP id u2-20020aa7d982000000b003cda80fa659so4611700eds.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Sep 2021 02:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9l0P5V3vonosFFJIQDtSd7XQpJ9Yj7ROYWAG0DyJcmo=;
        b=1j1HxM4Gy07b02VXQ4FfPTo1P/okIWC1cZIv7rPWcf8goCa7WKcv8Spl8yv0DmCwbH
         yL/msk31P+C8kQceIX7iNM+en9nGdFdNsTrr4YvjqubsAje9IsC1Xuov1lGLEF0T11sg
         9dHLZMifoqyFTmU2aepHcKRC3GdTj6GUfhq9bpxmwtcKrow7A6juohfCIhBnb04dyoOB
         XtXZfewNFqahTOhEJzL0hsMRZg0XLkbWuqmwmDD24JHOsIZvIv0YsmRdYWJ7JfDO5gvQ
         KXHY1i/HPhf/FsxzQrsKaV+4pJsbwOkae2p1Sq77zBmiZdNuZ9lII4bG1nPNPfEgXPu8
         Fevw==
X-Gm-Message-State: AOAM531TmsBGralIKZqiJG7EB8gq+QED8hX4Glsw7CAjjXVAEo1ij2rN
        tIMX4UE55c+7eaeERp9xZ3YwNz+djitza3Qn8WjRmvc6ly84zK54KTIrQdr266PgZsbnk/a8cRP
        i6zim0nD3Igtq+3IeyP70uMQr541t8CXSd+mIs+U6O+1Edm7/7OvHLaoVI3iXpQtxXzoFXmN5zP
        HgitGu6zLvOg==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr12067689edw.44.1631525006834;
        Mon, 13 Sep 2021 02:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHajwD6vV0+YTMIA4T5hnw1LCYdAkNeTPrUJR/G+6s4vjtAUWzhJlKXWWCyanU0e/fxKGUDA==
X-Received: by 2002:aa7:dd48:: with SMTP id o8mr12067677edw.44.1631525006595;
        Mon, 13 Sep 2021 02:23:26 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id cr9sm3573268edb.17.2021.09.13.02.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Sep 2021 02:23:26 -0700 (PDT)
Subject: Re: [RFC PATCH v1 05/30] platform/x86: wmi: remove unnecessary
 initializations
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
References: <20210904175450.156801-6-pobrn@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9fd1cfc7-9b9f-b2dc-c137-c274ba94fdb8@redhat.com>
Date:   Mon, 13 Sep 2021 11:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210904175450.156801-6-pobrn@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/21 7:55 PM, Barnabás Pőcze wrote:
> Some pointers are initialized when they are defined,
> but they are almost immediately reassigned in the
> following lines. Remove these superfluous assignments.
> 
> Signed-off-by: Barnabás Pőcze <pobrn@protonmail.com>

Erm so when I said "patch 6" in my reply to the cover-letter
I meant this one, sorry.

> ---
>  drivers/platform/x86/wmi.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 6ad5962da59b..36890e301df5 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -177,7 +177,7 @@ static int get_subobj_info(acpi_handle handle, const char *pathname,
> 
>  static acpi_status wmi_method_enable(struct wmi_block *wblock, int enable)
>  {
> -	struct guid_block *block = NULL;
> +	struct guid_block *block;
>  	char method[5];
>  	acpi_status status;
>  	acpi_handle handle;
> @@ -229,7 +229,7 @@ EXPORT_SYMBOL_GPL(set_required_buffer_size);
>  acpi_status wmi_evaluate_method(const char *guid_string, u8 instance,
>  u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
>  {
> -	struct wmi_block *wblock = NULL;
> +	struct wmi_block *wblock;
> 
>  	if (!find_guid(guid_string, &wblock))
>  		return AE_ERROR;

Here the pointer is not directly assigned but rather passed to
find_guid for it to fill it, in cases like these I prefer to
keep the NULL initialization, so I've dropped this chunk of the patch.

I've also dropped similar changes in wmi_set_block() and
wmi_get_acpi_device_uid(). I've made these changes while applying the
patch to my review-hans branch.

Regards,

Hans



> @@ -251,8 +251,8 @@ EXPORT_SYMBOL_GPL(wmi_evaluate_method);
>  acpi_status wmidev_evaluate_method(struct wmi_device *wdev, u8 instance,
>  	u32 method_id, const struct acpi_buffer *in, struct acpi_buffer *out)
>  {
> -	struct guid_block *block = NULL;
> -	struct wmi_block *wblock = NULL;
> +	struct guid_block *block;
> +	struct wmi_block *wblock;
>  	acpi_handle handle;
>  	acpi_status status;
>  	struct acpi_object_list input;
> @@ -299,7 +299,7 @@ EXPORT_SYMBOL_GPL(wmidev_evaluate_method);
>  static acpi_status __query_block(struct wmi_block *wblock, u8 instance,
>  				 struct acpi_buffer *out)
>  {
> -	struct guid_block *block = NULL;
> +	struct guid_block *block;
>  	acpi_handle handle;
>  	acpi_status status, wc_status = AE_ERROR;
>  	struct acpi_object_list input;
> @@ -405,8 +405,8 @@ EXPORT_SYMBOL_GPL(wmidev_block_query);
>  acpi_status wmi_set_block(const char *guid_string, u8 instance,
>  			  const struct acpi_buffer *in)
>  {
> -	struct guid_block *block = NULL;
> -	struct wmi_block *wblock = NULL;
> +	struct guid_block *block;
> +	struct wmi_block *wblock;
>  	acpi_handle handle;
>  	struct acpi_object_list input;
>  	union acpi_object params[2];
> @@ -650,7 +650,7 @@ EXPORT_SYMBOL_GPL(wmi_has_guid);
>   */
>  char *wmi_get_acpi_device_uid(const char *guid_string)
>  {
> -	struct wmi_block *wblock = NULL;
> +	struct wmi_block *wblock;
> 
>  	if (!find_guid(guid_string, &wblock))
>  		return NULL;
> @@ -811,8 +811,8 @@ static int wmi_dev_match(struct device *dev, struct device_driver *driver)
>  static int wmi_char_open(struct inode *inode, struct file *filp)
>  {
>  	const char *driver_name = filp->f_path.dentry->d_iname;
> -	struct wmi_block *wblock = NULL;
> -	struct wmi_block *next = NULL;
> +	struct wmi_block *wblock;
> +	struct wmi_block *next;
> 
>  	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
>  		if (!wblock->dev.dev.driver)
> @@ -844,8 +844,8 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  	struct wmi_ioctl_buffer __user *input =
>  		(struct wmi_ioctl_buffer __user *) arg;
>  	struct wmi_block *wblock = filp->private_data;
> -	struct wmi_ioctl_buffer *buf = NULL;
> -	struct wmi_driver *wdriver = NULL;
> +	struct wmi_ioctl_buffer *buf;
> +	struct wmi_driver *wdriver;
>  	int ret;
> 
>  	if (_IOC_TYPE(cmd) != WMI_IOC)
> --
> 2.33.0
> 
> 

