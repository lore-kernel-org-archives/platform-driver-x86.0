Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133ECC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 24 Feb 2022 15:23:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234694AbiBXPWp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 24 Feb 2022 10:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236168AbiBXPWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Feb 2022 10:22:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A797547ACB
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:21:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645716040;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gBWVLWrSKKBiPECFyJahujws6Q3+SC09cy88TK/w8Jk=;
        b=LvfLPa7yPoWChQxQRRqkab5q7RuiZL+sX7zEg44hmp0ChQ9h/FkWQUxbuYaSWZpmd9rrY6
        3vUF7nG9/VtoJaCSnq6b1bv1ZLiS4VX71fHym1HOuBYYEjaCOl3a6j6FtLD+JiKjlYQNOu
        uorGjy0fmgRDJiZii9MtzEGEqrBgoc4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-94FsybUFMUWSC2sGNVV-ZA-1; Thu, 24 Feb 2022 10:20:38 -0500
X-MC-Unique: 94FsybUFMUWSC2sGNVV-ZA-1
Received: by mail-ej1-f70.google.com with SMTP id la22-20020a170907781600b006a7884de505so1369186ejc.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Feb 2022 07:20:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gBWVLWrSKKBiPECFyJahujws6Q3+SC09cy88TK/w8Jk=;
        b=isWhjlHcnKvPMXr2bcu6s97+NqbVa7zGmX26Vi0qXLZTKEnUgvDL9R5QOKa7r6YmOj
         3pCegCEM1ppNakeA9VbpkUbogX4YTZkREFq+fnKhvAY15F4vk+ozchsKnRVaaiFx3P59
         mKECClcymtKqLSRMXEfKNSDz3mhjfPZQehbtLsXtnEdsbLN+LXgxKGSeaScwq2dcXE73
         Ap9VUt1YlECbS148ZfvRFMxPe3pduiR0wwSgjjcQZOxXgJsGt21Srv7DaV6HPruRBTtm
         zbdEww2N8NxAnyPVlNbeKEOl6qUuPlOhHDkl25UhoBrQYZn9tphQ6bGGWR6R2B7F4u3s
         ry2w==
X-Gm-Message-State: AOAM5313I22Oso2t1shthtuNeVlOqM/tQdBapupnHDxAJkVxFEkoq6jU
        5WxnInULLCpqSUjEicynAqqmgt0I8uRAd1/nDiZ+IDCzKYGS7HT+j21CEqUHrgu4/m4tqkFFNYV
        h3BS+Wdmra1d+Rb0nMFpagy96roo4fVmnWA==
X-Received: by 2002:a17:906:63d2:b0:6cf:e170:16a with SMTP id u18-20020a17090663d200b006cfe170016amr2690349ejk.119.1645716037610;
        Thu, 24 Feb 2022 07:20:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwCxG1sy+2yhWwGhgl6bBkW5IsyBaJIDupczRC87q7scnPnHV066od6e2eNV0n/7CTy07eOyQ==
X-Received: by 2002:a17:906:63d2:b0:6cf:e170:16a with SMTP id u18-20020a17090663d200b006cfe170016amr2690326ejk.119.1645716037282;
        Thu, 24 Feb 2022 07:20:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id ed11sm1429971edb.81.2022.02.24.07.20.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Feb 2022 07:20:36 -0800 (PST)
Message-ID: <a4c32908-3f54-c375-5efe-fd4daf8ebdf7@redhat.com>
Date:   Thu, 24 Feb 2022 16:20:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v7 2/2] Documentation: Add x86/amd_hsmp driver
Content-Language: en-US
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     carlos.bilbao@amd.com, siva.sathappan@amd.com, song@kernel.org,
        nathan.fontenot@amd.com
References: <20220222050501.18789-1-nchatrad@amd.com>
 <20220222050501.18789-2-nchatrad@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220222050501.18789-2-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/22/22 06:05, Naveen Krishna Chatradhi wrote:
> This documentation for amd_hsmp driver explains how to use the
> device interface.
> 
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Acked-by: Song Liu <song@kernel.org>

This patch causes a number of new warning when running "make htmldocs":

amd_hsmp.rst:51: WARNING: Literal block ends without a blank line; unexpected unindent.
amd_hsmp.rst:68: WARNING: Literal block expected; none found.
amd_hsmp.rst:69: WARNING: Inline emphasis start-string without end-string.
amd_hsmp.rst:74: WARNING: Definition list ends without a blank line; unexpected unindent.
amd_hsmp.rst: WARNING: document isn't included in any toctree

I've fixed these before merging, but next time please run
"make htmldocs" and check for new warnings before submitting
documentation patches.

Thank you for your patch, I've applied this patch to my review-hans 
branch:
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
> Changes since v6:
> Add acked by from Song Liu
> Changes since v5:
>  variable name changed from buf to args
> Changes since v4:
> struct hsmp_message is updated
> Changes since v3:
>  remove change ids
> Changes since v2:
>  Add statement saying the HSMP interface is supported only on
>  server cpu models from AMD.
> Changes since v1:
>  None
> 
>  Documentation/x86/amd_hsmp.rst | 85 ++++++++++++++++++++++++++++++++++
>  1 file changed, 85 insertions(+)
>  create mode 100644 Documentation/x86/amd_hsmp.rst
> 
> diff --git a/Documentation/x86/amd_hsmp.rst b/Documentation/x86/amd_hsmp.rst
> new file mode 100644
> index 000000000000..9de7e028d6e3
> --- /dev/null
> +++ b/Documentation/x86/amd_hsmp.rst
> @@ -0,0 +1,85 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +============================================
> +AMD HSMP interface
> +============================================
> +
> +Newer Fam19h EPYC server line of processors from AMD support system
> +management functionality via HSMP (Host System Management Port).
> +
> +The Host System Management Port (HSMP) is an interface to provide
> +OS-level software with access to system management functions via a
> +set of mailbox registers.
> +
> +More details on the interface can be found in chapter
> +"7 Host System Management Port (HSMP)" of the family/model PPR
> +Eg: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
> +
> +HSMP interface is supported on EPYC server CPU models only.
> +
> +
> +HSMP device
> +============================================
> +
> +amd_hsmp driver under the drivers/platforms/x86/ creates miscdevice
> +/dev/hsmp to let user space programs run hsmp mailbox commands.
> +
> +$ ls -al /dev/hsmp
> +crw-r--r-- 1 root root 10, 123 Jan 21 21:41 /dev/hsmp
> +
> +Characteristics of the dev node:
> + * Write mode is used for running set/configure commands
> + * Read mode is used for running get/status monitor commands
> +
> +Access restrictions:
> + * Only root user is allowed to open the file in write mode.
> + * The file can be opened in read mode by all the users.
> +
> +In-kernel integration:
> + * Other subsystems in the kernel can use the exported transport
> +   function hsmp_send_message().
> + * Locking across callers is taken care by the driver.
> +
> +
> +An example
> +==========
> +
> +To access hsmp device from a C program.
> +First, you need to include the headers::
> +
> +  #include <linux/amd_hsmp.h>
> +Which defines the supported messages/message IDs.
> +
> +Next thing, open the device file, as follows::
> +
> +  int file;
> +
> +  file = open("/dev/hsmp", O_RDWR);
> +  if (file < 0) {
> +    /* ERROR HANDLING; you can check errno to see what went wrong */
> +    exit(1);
> +  }
> +
> +The following IOCTL is defined:
> +
> +``ioctl(file, HSMP_IOCTL_CMD, struct hsmp_message *msg)``
> +  The argument is a pointer to a::
> +
> +struct hsmp_message {
> +	__u32	msg_id;				/* Message ID */
> +	__u16	num_args;			/* Number of input argument words in message */
> +	__u16	response_sz;			/* Number of expected output/response words */
> +	__u32	args[HSMP_MAX_MSG_LEN];		/* argument/response buffer */
> +	__u16	sock_ind;			/* socket number */
> +};
> +
> +The ioctl would return a non-zero on failure; you can read errno to see
> +what happened. The transaction returns 0 on success.
> +
> +More details on the interface and message definitions can be found in chapter
> +"7 Host System Management Port (HSMP)" of the respective family/model PPR
> +eg: https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
> +
> +User space C-APIs are made available by linking against the esmi library,
> +which is provided by the E-SMS project https://developer.amd.com/e-sms/.
> +See: https://github.com/amd/esmi_ib_library

