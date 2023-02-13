Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BB97C636D4
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Feb 2023 11:13:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjBMLNr (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Feb 2023 06:13:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230472AbjBMLNa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 06:13:30 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A532D539
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 03:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676286712;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8nFI7lNq8nmrNmkBJyH+zZxWIR6e+Qbe18vgRT3dj8E=;
        b=EFIZmhGWSPo5Ouot8hh2sqF0NUA7XiBO1Kjp9c43MZghBQyX/BbV7ymCSpownwT0E9WMMO
        2DBQPZC8AoHDgI+lq0nMxaUCUUbkJ5Bax/i4ikuQhhOdfSsvjMP14Kt1mzMYJt66VN/VIq
        ash8WhDLhE+OPrMhKsQZD7PQ6qOd0tM=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-vmJD95-sORudGDH4jckIjQ-1; Mon, 13 Feb 2023 06:11:50 -0500
X-MC-Unique: vmJD95-sORudGDH4jckIjQ-1
Received: by mail-ed1-f70.google.com with SMTP id s3-20020a50ab03000000b0049ec3a108beso7315750edc.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 03:11:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8nFI7lNq8nmrNmkBJyH+zZxWIR6e+Qbe18vgRT3dj8E=;
        b=C3gvWZoAS76rbCBlIzN23vJfnvXoQZP4GnmxpYfBLn8Ln7mNcaaXhk4AZ5r5E+BG9B
         HYPqAzmbqsgdYshSgtF1oKhoSD/aRb0/D+rvdN08dC8KKVwsEMxLOqjE2/LmfqXqKzVL
         2O38UO6FcYLPIm7MdIujht2T9xpuko2sLnsBlKQO17VqttMifkk20bpsVWmJNcbnjCb5
         sbIaNk7VANZ3LWf8qw3TB+Na8S64R+NGKb1qHQn1oOT51UYHibUuowD9ekALmcWoIKcv
         SaGHfXUliTAiCombUSMGnqGU6i3e7fFB7pZ7EPU1+H0HQOvx1Q4Jb5uclbMKZD0gxm12
         +JJQ==
X-Gm-Message-State: AO0yUKX/M3OIdW7C8FdyMN2iZcdprPz+ozUKSRbLPosIrH51he7SEM/W
        Uvnh2Y/QNXVthbYYY33YVglffEITBlDBurQgCNycmoMAuUc1HrjP21f6UhJ768fPxphnhub41yF
        vxp92I+r+qhcfPX88PGz0wD29W6+z1+Fpy4LVMyA=
X-Received: by 2002:a17:906:179b:b0:87b:3d29:2990 with SMTP id t27-20020a170906179b00b0087b3d292990mr23188513eje.9.1676286709387;
        Mon, 13 Feb 2023 03:11:49 -0800 (PST)
X-Google-Smtp-Source: AK7set/i2lSLj+tMzIC1T5/Q2+58+lKBEBQWD34zxbZNa04ZGWhgpTKFRnPWzXgl50DxOb4hLdI9kw==
X-Received: by 2002:a17:906:179b:b0:87b:3d29:2990 with SMTP id t27-20020a170906179b00b0087b3d292990mr23188507eje.9.1676286709246;
        Mon, 13 Feb 2023 03:11:49 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b0087bd4e34eb8sm6592522ejj.203.2023.02.13.03.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 03:11:48 -0800 (PST)
Message-ID: <4a65ba8e-ace6-9ce7-dad6-7faa5206a585@redhat.com>
Date:   Mon, 13 Feb 2023 12:11:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH platform-next 1/1] Squash to commit cbf3f15f51c5
 ("platform: mellanox: Split logic in init and exit flow")
Content-Language: en-US
To:     Vadim Pasternak <vadimp@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org
References: <20230212083350.52633-1-vadimp@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230212083350.52633-1-vadimp@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/12/23 09:33, Vadim Pasternak wrote:
> Squash to branch review-hans.
> 
> Fix robot warning: drivers/platform/x86/mlx-platform.c:6121:6:
> warning: variable 'i' is used uninitialized whenever 'if' condition is
> true [-Wsometimes-uninitialized].
> 
> drivers/platform/x86/mlx-platform.c:6062:7: note: initialize the
> variable 'i' to silence this warning
> 	int i, err;
> 		^
> 		= 0
> 
> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> Reported-by: kernel test robot <lkp@intel.com>

Thank you.

Squashed into the original commit as requested and pushed
to review-hans + for-next.

Regards,

Hans



> ---
>  drivers/platform/x86/mlx-platform.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
> index 1bf9ef6e8c97..7b6779cdb134 100644
> --- a/drivers/platform/x86/mlx-platform.c
> +++ b/drivers/platform/x86/mlx-platform.c
> @@ -6083,7 +6083,7 @@ static void mlxplat_post_exit(void)
>  
>  static int mlxplat_post_init(struct mlxplat_priv *priv)
>  {
> -	int i, err;
> +	int i = 0, err;
>  
>  	/* Add hotplug driver */
>  	if (mlxplat_hotplug) {

