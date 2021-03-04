Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC96C433DB
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 19:14:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5745B64F6D
	for <platform-driver-x86@archiver.kernel.org>; Thu,  4 Mar 2021 19:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233837AbhCDTN4 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 4 Mar 2021 14:13:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50791 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235089AbhCDTNy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 14:13:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614885148;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GHSMUe6QmToxCvsSjq0Qja36XWKvqgRhJNzhhw9VASI=;
        b=Xct9tL2aSdP9QU/QQ21UzVvwj1zoEZV/D1Lqx/S7+Wp7hQqkRJbHZwmDHImrVpljJ1RgLb
        4U82ahZK6/jEff07U8ngld5IoSLyZ9ZBnxPYEeR3JvIkToO9cKSRbotabkJz4iZUt1Gu6z
        FTDXRJ5S5a/Z2RZ50Wt3A5482QUlAWw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31--vq_olhGMY6Zc-aTqLKlLg-1; Thu, 04 Mar 2021 14:12:25 -0500
X-MC-Unique: -vq_olhGMY6Zc-aTqLKlLg-1
Received: by mail-ej1-f72.google.com with SMTP id w22so12674207ejv.18
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 11:12:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GHSMUe6QmToxCvsSjq0Qja36XWKvqgRhJNzhhw9VASI=;
        b=BLNMN7sgrayB2AIg4K+YR4i7cBZnqEcbYfXpGgSDSfDAynRsGFFxO+2PYoU51la+8K
         //U4WlVB4qXu/4rCigqn9mQ39XVfr60yznv58XOPxzJaxMX3dPcS26abbAD/GusxaCv2
         cG1P+667zQKbbzVL8e70vknS74smeMgwj4Q3I4mgq7eByOAdKmjZgLU2kY7jRANt/oT9
         rSGXVShQS9BSjFdtCp6XNbWIoxXmKYYWP30DOfnHKVS5Xc6C64LL8NX/dOq+Q//v6TRy
         A8SpytefXIz2lEyQXwm6+uviZ74PohIY6bDDjVn7nFkkBr9tKtdHDqRiG3OmQRy03aQc
         s5GQ==
X-Gm-Message-State: AOAM531tu2DT+BbBsouMDp4IH1ILMHGwAcPx4i8+GqiN2fGhX3S9ZlkG
        e7U9QhDe92afVtRngubAMdDrBTH+SOb5cxKJJoZoyO3l3BOiLrbUyH9PmQDn8jmTSrIQdmWqb6l
        hGb2A4WThJX/jxdSaAP0vTxb/YufOg19jQg==
X-Received: by 2002:a17:906:1b41:: with SMTP id p1mr371713ejg.174.1614885143858;
        Thu, 04 Mar 2021 11:12:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyoBRSvYPxZ4fv4myBhnl3YY4u84NvONYKnfMLSHYkACHavxRGeJhinudvPz+IMeS/1wxpmFw==
X-Received: by 2002:a17:906:1b41:: with SMTP id p1mr371684ejg.174.1614885143460;
        Thu, 04 Mar 2021 11:12:23 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g3sm168989edk.75.2021.03.04.11.12.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 11:12:20 -0800 (PST)
Subject: Re: [PATCH] platform/surface: aggregator: Make
 SSAM_DEFINE_SYNC_REQUEST_x define static functions
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20210304190524.1172197-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bc966f43-4a66-09c7-3b40-30d308146e19@redhat.com>
Date:   Thu, 4 Mar 2021 20:12:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210304190524.1172197-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/4/21 8:05 PM, Maximilian Luz wrote:
> The SSAM_DEFINE_SYNC_REQUEST_x() macros are intended to reduce
> boiler-plate code for SSAM request definitions by defining a wrapper
> function for the specified request. The client device variants of those
> macros, i.e. SSAM_DEFINE_SYNC_REQUEST_CL_x() in particular rely on the
> multi-device (MD) variants, e.g.:
> 
>     #define SSAM_DEFINE_SYNC_REQUEST_CL_R(name, rtype, spec...)   \
>         SSAM_DEFINE_SYNC_REQUEST_MD_R(__raw_##name, rtype, spec)  \
>         int name(struct ssam_device *sdev, rtype *ret)            \
>         {                                                         \
>             return __raw_##name(sdev->ctrl, sdev->uid.target,     \
>                                 sdev->uid.instance, ret);         \
>         }
> 
> This now creates the problem that it is not possible to declare the
> generated functions static via
> 
>     static SSAM_DEFINE_SYNC_REQUEST_CL_R(...)
> 
> as this will only apply to the function defined by the multi-device
> macro, i.e. SSAM_DEFINE_SYNC_REQUEST_MD_R(). Thus compiling with
> `-Wmissing-prototypes' rightfully complains that there is a 'static'
> keyword missing.
> 
> To solve this, make all SSAM_DEFINE_SYNC_REQUEST_x() macros define
> static functions. Non-client-device macros are also changed for
> consistency. In general, we expect those functions to be only used
> locally in the respective drivers for the corresponding interfaces, so
> having to define a wrapper function to be able to export this should be
> the odd case out.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 510c8114fc74 ("platform/surface: Add platform profile driver")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for the quick fix.

I've applied this patch to my review-hans branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  .../driver-api/surface_aggregator/client.rst  |  4 +-
>  .../platform/surface/aggregator/controller.c  | 10 +--
>  .../surface/surface_aggregator_registry.c     |  2 +-
>  .../surface/surface_platform_profile.c        |  4 +-
>  include/linux/surface_aggregator/controller.h | 74 +++++++++----------
>  include/linux/surface_aggregator/device.h     | 31 ++++----
>  6 files changed, 63 insertions(+), 62 deletions(-)
> 
> diff --git a/Documentation/driver-api/surface_aggregator/client.rst b/Documentation/driver-api/surface_aggregator/client.rst
> index 26d13085a117..e519d374c378 100644
> --- a/Documentation/driver-api/surface_aggregator/client.rst
> +++ b/Documentation/driver-api/surface_aggregator/client.rst
> @@ -248,7 +248,7 @@ This example defines a function
>  
>  .. code-block:: c
>  
> -   int __ssam_tmp_perf_mode_set(struct ssam_controller *ctrl, const __le32 *arg);
> +   static int __ssam_tmp_perf_mode_set(struct ssam_controller *ctrl, const __le32 *arg);
>  
>  executing the specified request, with the controller passed in when calling
>  said function. In this example, the argument is provided via the ``arg``
> @@ -296,7 +296,7 @@ This invocation of the macro defines a function
>  
>  .. code-block:: c
>  
> -   int ssam_bat_get_sta(struct ssam_device *sdev, __le32 *ret);
> +   static int ssam_bat_get_sta(struct ssam_device *sdev, __le32 *ret);
>  
>  executing the specified request, using the device IDs and controller given
>  in the client device. The full list of such macros for client devices is:
> diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
> index 5bcb59ed579d..aa6f37b4f46e 100644
> --- a/drivers/platform/surface/aggregator/controller.c
> +++ b/drivers/platform/surface/aggregator/controller.c
> @@ -1750,35 +1750,35 @@ EXPORT_SYMBOL_GPL(ssam_request_sync_with_buffer);
>  
>  /* -- Internal SAM requests. ------------------------------------------------ */
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_get_firmware_version, __le32, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_get_firmware_version, __le32, {
>  	.target_category = SSAM_SSH_TC_SAM,
>  	.target_id       = 0x01,
>  	.command_id      = 0x13,
>  	.instance_id     = 0x00,
>  });
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_display_off, u8, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_display_off, u8, {
>  	.target_category = SSAM_SSH_TC_SAM,
>  	.target_id       = 0x01,
>  	.command_id      = 0x15,
>  	.instance_id     = 0x00,
>  });
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_display_on, u8, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_display_on, u8, {
>  	.target_category = SSAM_SSH_TC_SAM,
>  	.target_id       = 0x01,
>  	.command_id      = 0x16,
>  	.instance_id     = 0x00,
>  });
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_d0_exit, u8, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_d0_exit, u8, {
>  	.target_category = SSAM_SSH_TC_SAM,
>  	.target_id       = 0x01,
>  	.command_id      = 0x33,
>  	.instance_id     = 0x00,
>  });
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_d0_entry, u8, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_ssh_notif_d0_entry, u8, {
>  	.target_category = SSAM_SSH_TC_SAM,
>  	.target_id       = 0x01,
>  	.command_id      = 0x34,
> diff --git a/drivers/platform/surface/surface_aggregator_registry.c b/drivers/platform/surface/surface_aggregator_registry.c
> index caee90d135c5..cdb4a95af3e8 100644
> --- a/drivers/platform/surface/surface_aggregator_registry.c
> +++ b/drivers/platform/surface/surface_aggregator_registry.c
> @@ -302,7 +302,7 @@ struct ssam_base_hub {
>  	struct ssam_event_notifier notif;
>  };
>  
> -static SSAM_DEFINE_SYNC_REQUEST_R(ssam_bas_query_opmode, u8, {
> +SSAM_DEFINE_SYNC_REQUEST_R(ssam_bas_query_opmode, u8, {
>  	.target_category = SSAM_SSH_TC_BAS,
>  	.target_id       = 0x01,
>  	.command_id      = 0x0d,
> diff --git a/drivers/platform/surface/surface_platform_profile.c b/drivers/platform/surface/surface_platform_profile.c
> index 0081b01a5b0f..6373d3b5eb7f 100644
> --- a/drivers/platform/surface/surface_platform_profile.c
> +++ b/drivers/platform/surface/surface_platform_profile.c
> @@ -32,12 +32,12 @@ struct ssam_tmp_profile_device {
>  	struct platform_profile_handler handler;
>  };
>  
> -static SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_profile_get, struct ssam_tmp_profile_info, {
> +SSAM_DEFINE_SYNC_REQUEST_CL_R(__ssam_tmp_profile_get, struct ssam_tmp_profile_info, {
>  	.target_category = SSAM_SSH_TC_TMP,
>  	.command_id      = 0x02,
>  });
>  
> -static SSAM_DEFINE_SYNC_REQUEST_CL_W(__ssam_tmp_profile_set, __le32, {
> +SSAM_DEFINE_SYNC_REQUEST_CL_W(__ssam_tmp_profile_set, __le32, {
>  	.target_category = SSAM_SSH_TC_TMP,
>  	.command_id      = 0x03,
>  });
> diff --git a/include/linux/surface_aggregator/controller.h b/include/linux/surface_aggregator/controller.h
> index f4b1ba887384..0806796eabcb 100644
> --- a/include/linux/surface_aggregator/controller.h
> +++ b/include/linux/surface_aggregator/controller.h
> @@ -344,16 +344,16 @@ struct ssam_request_spec_md {
>   * request has been fully completed. The required transport buffer will be
>   * allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl)``, returning the status of the request, which is zero on success and
> - * negative on failure. The ``ctrl`` parameter is the controller via which the
> - * request is being sent.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl)``, returning the status of the request, which is
> + * zero on success and negative on failure. The ``ctrl`` parameter is the
> + * controller via which the request is being sent.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_N(name, spec...)				\
> -	int name(struct ssam_controller *ctrl)					\
> +	static int name(struct ssam_controller *ctrl)				\
>  	{									\
>  		struct ssam_request_spec s = (struct ssam_request_spec)spec;	\
>  		struct ssam_request rqst;					\
> @@ -383,17 +383,17 @@ struct ssam_request_spec_md {
>   * returning once the request has been fully completed. The required transport
>   * buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl, const atype *arg)``, returning the status of the request, which is
> - * zero on success and negative on failure. The ``ctrl`` parameter is the
> - * controller via which the request is sent. The request argument is specified
> - * via the ``arg`` pointer.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl, const atype *arg)``, returning the status of the
> + * request, which is zero on success and negative on failure. The ``ctrl``
> + * parameter is the controller via which the request is sent. The request
> + * argument is specified via the ``arg`` pointer.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_W(name, atype, spec...)			\
> -	int name(struct ssam_controller *ctrl, const atype *arg)		\
> +	static int name(struct ssam_controller *ctrl, const atype *arg)		\
>  	{									\
>  		struct ssam_request_spec s = (struct ssam_request_spec)spec;	\
>  		struct ssam_request rqst;					\
> @@ -424,17 +424,17 @@ struct ssam_request_spec_md {
>   * request itself, returning once the request has been fully completed. The
>   * required transport buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl, rtype *ret)``, returning the status of the request, which is zero on
> - * success and negative on failure. The ``ctrl`` parameter is the controller
> - * via which the request is sent. The request's return value is written to the
> - * memory pointed to by the ``ret`` parameter.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl, rtype *ret)``, returning the status of the request,
> + * which is zero on success and negative on failure. The ``ctrl`` parameter is
> + * the controller via which the request is sent. The request's return value is
> + * written to the memory pointed to by the ``ret`` parameter.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_R(name, rtype, spec...)			\
> -	int name(struct ssam_controller *ctrl, rtype *ret)			\
> +	static int name(struct ssam_controller *ctrl, rtype *ret)		\
>  	{									\
>  		struct ssam_request_spec s = (struct ssam_request_spec)spec;	\
>  		struct ssam_request rqst;					\
> @@ -483,17 +483,17 @@ struct ssam_request_spec_md {
>   * returning once the request has been fully completed. The required transport
>   * buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl, u8 tid, u8 iid)``, returning the status of the request, which is
> - * zero on success and negative on failure. The ``ctrl`` parameter is the
> - * controller via which the request is sent, ``tid`` the target ID for the
> - * request, and ``iid`` the instance ID.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl, u8 tid, u8 iid)``, returning the status of the
> + * request, which is zero on success and negative on failure. The ``ctrl``
> + * parameter is the controller via which the request is sent, ``tid`` the
> + * target ID for the request, and ``iid`` the instance ID.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_MD_N(name, spec...)				\
> -	int name(struct ssam_controller *ctrl, u8 tid, u8 iid)			\
> +	static int name(struct ssam_controller *ctrl, u8 tid, u8 iid)		\
>  	{									\
>  		struct ssam_request_spec_md s = (struct ssam_request_spec_md)spec; \
>  		struct ssam_request rqst;					\
> @@ -524,18 +524,18 @@ struct ssam_request_spec_md {
>   * the request itself, returning once the request has been fully completed.
>   * The required transport buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl, u8 tid, u8 iid, const atype *arg)``, returning the status of the
> - * request, which is zero on success and negative on failure. The ``ctrl``
> - * parameter is the controller via which the request is sent, ``tid`` the
> - * target ID for the request, and ``iid`` the instance ID. The request argument
> - * is specified via the ``arg`` pointer.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl, u8 tid, u8 iid, const atype *arg)``, returning the
> + * status of the request, which is zero on success and negative on failure.
> + * The ``ctrl`` parameter is the controller via which the request is sent,
> + * ``tid`` the target ID for the request, and ``iid`` the instance ID. The
> + * request argument is specified via the ``arg`` pointer.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_MD_W(name, atype, spec...)			\
> -	int name(struct ssam_controller *ctrl, u8 tid, u8 iid, const atype *arg)\
> +	static int name(struct ssam_controller *ctrl, u8 tid, u8 iid, const atype *arg) \
>  	{									\
>  		struct ssam_request_spec_md s = (struct ssam_request_spec_md)spec; \
>  		struct ssam_request rqst;					\
> @@ -567,18 +567,18 @@ struct ssam_request_spec_md {
>   * execution of the request itself, returning once the request has been fully
>   * completed. The required transport buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_controller
> - * *ctrl, u8 tid, u8 iid, rtype *ret)``, returning the status of the request,
> - * which is zero on success and negative on failure. The ``ctrl`` parameter is
> - * the controller via which the request is sent, ``tid`` the target ID for the
> - * request, and ``iid`` the instance ID. The request's return value is written
> - * to the memory pointed to by the ``ret`` parameter.
> + * The generated function is defined as ``static int name(struct
> + * ssam_controller *ctrl, u8 tid, u8 iid, rtype *ret)``, returning the status
> + * of the request, which is zero on success and negative on failure. The
> + * ``ctrl`` parameter is the controller via which the request is sent, ``tid``
> + * the target ID for the request, and ``iid`` the instance ID. The request's
> + * return value is written to the memory pointed to by the ``ret`` parameter.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_MD_R(name, rtype, spec...)			\
> -	int name(struct ssam_controller *ctrl, u8 tid, u8 iid, rtype *ret)	\
> +	static int name(struct ssam_controller *ctrl, u8 tid, u8 iid, rtype *ret) \
>  	{									\
>  		struct ssam_request_spec_md s = (struct ssam_request_spec_md)spec; \
>  		struct ssam_request rqst;					\
> diff --git a/include/linux/surface_aggregator/device.h b/include/linux/surface_aggregator/device.h
> index 02f3e06c0a60..4441ad667c3f 100644
> --- a/include/linux/surface_aggregator/device.h
> +++ b/include/linux/surface_aggregator/device.h
> @@ -336,17 +336,18 @@ void ssam_device_driver_unregister(struct ssam_device_driver *d);
>   * request has been fully completed. The required transport buffer will be
>   * allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_device *sdev)``,
> - * returning the status of the request, which is zero on success and negative
> - * on failure. The ``sdev`` parameter specifies both the target device of the
> - * request and by association the controller via which the request is sent.
> + * The generated function is defined as ``static int name(struct ssam_device
> + * *sdev)``, returning the status of the request, which is zero on success and
> + * negative on failure. The ``sdev`` parameter specifies both the target
> + * device of the request and by association the controller via which the
> + * request is sent.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_CL_N(name, spec...)			\
>  	SSAM_DEFINE_SYNC_REQUEST_MD_N(__raw_##name, spec)		\
> -	int name(struct ssam_device *sdev)				\
> +	static int name(struct ssam_device *sdev)			\
>  	{								\
>  		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
>  				    sdev->uid.instance);		\
> @@ -368,19 +369,19 @@ void ssam_device_driver_unregister(struct ssam_device_driver *d);
>   * itself, returning once the request has been fully completed. The required
>   * transport buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_device *sdev,
> - * const atype *arg)``, returning the status of the request, which is zero on
> - * success and negative on failure. The ``sdev`` parameter specifies both the
> - * target device of the request and by association the controller via which
> - * the request is sent. The request's argument is specified via the ``arg``
> - * pointer.
> + * The generated function is defined as ``static int name(struct ssam_device
> + * *sdev, const atype *arg)``, returning the status of the request, which is
> + * zero on success and negative on failure. The ``sdev`` parameter specifies
> + * both the target device of the request and by association the controller via
> + * which the request is sent. The request's argument is specified via the
> + * ``arg`` pointer.
>   *
>   * Refer to ssam_request_sync_onstack() for more details on the behavior of
>   * the generated function.
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_CL_W(name, atype, spec...)		\
>  	SSAM_DEFINE_SYNC_REQUEST_MD_W(__raw_##name, atype, spec)	\
> -	int name(struct ssam_device *sdev, const atype *arg)		\
> +	static int name(struct ssam_device *sdev, const atype *arg)	\
>  	{								\
>  		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
>  				    sdev->uid.instance, arg);		\
> @@ -402,8 +403,8 @@ void ssam_device_driver_unregister(struct ssam_device_driver *d);
>   * itself, returning once the request has been fully completed. The required
>   * transport buffer will be allocated on the stack.
>   *
> - * The generated function is defined as ``int name(struct ssam_device *sdev,
> - * rtype *ret)``, returning the status of the request, which is zero on
> + * The generated function is defined as ``static int name(struct ssam_device
> + * *sdev, rtype *ret)``, returning the status of the request, which is zero on
>   * success and negative on failure. The ``sdev`` parameter specifies both the
>   * target device of the request and by association the controller via which
>   * the request is sent. The request's return value is written to the memory
> @@ -414,7 +415,7 @@ void ssam_device_driver_unregister(struct ssam_device_driver *d);
>   */
>  #define SSAM_DEFINE_SYNC_REQUEST_CL_R(name, rtype, spec...)		\
>  	SSAM_DEFINE_SYNC_REQUEST_MD_R(__raw_##name, rtype, spec)	\
> -	int name(struct ssam_device *sdev, rtype *ret)			\
> +	static int name(struct ssam_device *sdev, rtype *ret)		\
>  	{								\
>  		return __raw_##name(sdev->ctrl, sdev->uid.target,	\
>  				    sdev->uid.instance, ret);		\
> 

