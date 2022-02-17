Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 664FDC433F5
	for <platform-driver-x86@archiver.kernel.org>; Thu, 17 Feb 2022 23:46:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229455AbiBQXrH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 17 Feb 2022 18:47:07 -0500
Received: from gmail-smtp-in.l.google.com ([23.128.96.19]:52724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbiBQXrG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Feb 2022 18:47:06 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EC5E378F76
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 15:46:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 37FE4B8251F
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 23:32:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07ED6C340E8
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 23:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645140741;
        bh=Bao+MFIjDpN0PPITebqS1B9I9qB0sfe7YLmILSCG20Y=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FW2eIBLw0ot9uPB3gQEtErxY5TXkzo+ggTH5MZIC/N7C2j9UoLmUad6FmLM4sYGWy
         /1dLTgnHHjNdsMjrFh5J4bATuvGvvAgFO9VWRQzv+7PofIokIDfNEysT2Eht273/l/
         35pYqrBhxRuwHjgl5XMp7cHGvEenYmz20NbIFOOykU0Ge5iuIg/E5o9uyULPTjJO6T
         kE+D+XxJllfkXZQUa68JUiP+C7HYNH576BDLcPOoTARIp28m5nIaNIqo3SYERkEZtG
         qrcKy4Jty+rHhX/CuVmbecBHcxW4JRhaVVVUkw3AgpAetSMiOPQ1lk0+sZ5R5+ioGp
         WOp3TjVeAb0sA==
Received: by mail-yb1-f182.google.com with SMTP id u12so2207183ybd.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Feb 2022 15:32:20 -0800 (PST)
X-Gm-Message-State: AOAM533d6PXKaTHeNRbiynkcnobY7/ClQoGO3gVpEqjw8ff6B/3T8vFY
        0KusToNj+I6bWXdqUzBaP/ppGFOAbAvaz5F9RqA=
X-Google-Smtp-Source: ABdhPJxOEyQBO9i6/gsMlRtswYKkL6D5rHY+aOGQvr6f7qzkqiTYAxmS9SxVsFT4rHBF8ftVSRIgv2zQmLzj1e+1tn4=
X-Received: by 2002:a25:bcca:0:b0:622:34dd:d1dc with SMTP id
 l10-20020a25bcca000000b0062234ddd1dcmr4822660ybm.449.1645140740157; Thu, 17
 Feb 2022 15:32:20 -0800 (PST)
MIME-Version: 1.0
References: <20220217102041.30088-1-nchatrad@amd.com> <20220217102041.30088-2-nchatrad@amd.com>
In-Reply-To: <20220217102041.30088-2-nchatrad@amd.com>
From:   Song Liu <song@kernel.org>
Date:   Thu, 17 Feb 2022 15:32:09 -0800
X-Gmail-Original-Message-ID: <CAPhsuW7mimSztG7jWzAAi4OoqQAruUf0AN5LFAQ7eE4WPX=_9Q@mail.gmail.com>
Message-ID: <CAPhsuW7mimSztG7jWzAAi4OoqQAruUf0AN5LFAQ7eE4WPX=_9Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] Documentation: Add x86/amd_hsmp driver
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Carlos Bilbao <carlos.bilbao@amd.com>, siva.sathappan@amd.com,
        nathan.fontenot@amd.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Feb 17, 2022 at 2:22 AM Naveen Krishna Chatradhi
<nchatrad@amd.com> wrote:
>
> This documentation for amd_hsmp driver explains how to use the
> device interface.
>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>

Acked-by: Song Liu <song@kernel.org>

> ---
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
> +       __u32   msg_id;                         /* Message ID */
> +       __u16   num_args;                       /* Number of input argument words in message */
> +       __u16   response_sz;                    /* Number of expected output/response words */
> +       __u32   args[HSMP_MAX_MSG_LEN];         /* argument/response buffer */
> +       __u16   sock_ind;                       /* socket number */
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
> --
> 2.17.1
>
