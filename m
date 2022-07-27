Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2407DC04A68
	for <platform-driver-x86@archiver.kernel.org>; Wed, 27 Jul 2022 20:52:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiG0Uwh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 27 Jul 2022 16:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbiG0Uwg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Jul 2022 16:52:36 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C527C5071D
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658955153;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fol8CsQN97d5WIOJcVV0om0tULr/TAMgyaTN0LEdGEU=;
        b=hLgEHJkCFP33q6xLuc1hYLG4KVTcCcU3DXpGQ0BCit6yGcq57JSUzB1fbwNLa6d6yj7GVO
        jxL8dwPq8svnynrfk8D4NIOJJQ733fM0+vrNzyLgus0LGcyRt0/5lqSWP7w3lc3ofqHJnV
        EX97nwXAZ2EEazc7WB7vAovf+4TdYHc=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-357-VCSai_pKM0KBuFuN4kfDsg-1; Wed, 27 Jul 2022 16:52:32 -0400
X-MC-Unique: VCSai_pKM0KBuFuN4kfDsg-1
Received: by mail-ed1-f72.google.com with SMTP id y2-20020a056402440200b0043bd6c898deso9011509eda.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 27 Jul 2022 13:52:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=fol8CsQN97d5WIOJcVV0om0tULr/TAMgyaTN0LEdGEU=;
        b=ZrWfQTbJuR2KpjI7VDg99wwACNOzOQpJ5s4Mbr5y19FjD0OKz16LdkOObb5EMGBHvq
         HFuV4qAeVnF/NQzzBzcrsjHI5N/Yvg4RSCStQgnJpaV/Ew+JXXr+1p+rWlWgT89oGF9C
         rkWSpmIxmAVJ0Xf02B07nXSXs+WAGP2yNgkUlueRnKPzMoU/Mx4T2g8JT3oJWjwKXCsC
         efwbS8SL0QUGDSwbUxDHshTpBOmJk31xHe/56yBODOBmRWu3q7MmuM7x5jFJnk/jDvUs
         sAs4mHz3RRWdauYfZ+S/WlZxSqGzPabNABMjR8APNZ0LdJlDSjqdfFCGfrgVe9g1eojr
         ESeg==
X-Gm-Message-State: AJIora8EI0q2vfQYwPZNRwfm50B0jF+BZvvNMTO3EFN7Ru/boDs1LbSY
        6Z6KtkXw33I5fVLlQ/6wisoJ8pbQzD0iU5r5IL67W5PZrTF4cZGygyyitWRJUAk4HjFlzb9siqz
        5VyeifhS5qrtDANLNil0vVRgIRd7U7koKuQ==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id eb5-20020a0564020d0500b00425b5c8faebmr23996438edb.273.1658955151234;
        Wed, 27 Jul 2022 13:52:31 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sPR1ppOqQVHQZsK7E4HpCfazz0dxbSENQ85RWyyKz6rvL6qVkPlLyTjcYuo4iqYGF6/E2CIg==
X-Received: by 2002:a05:6402:d05:b0:425:b5c8:faeb with SMTP id eb5-20020a0564020d0500b00425b5c8faebmr23996414edb.273.1658955150768;
        Wed, 27 Jul 2022 13:52:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id i8-20020aa7c9c8000000b0043bbf79b3ebsm10766119edt.54.2022.07.27.13.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 13:52:30 -0700 (PDT)
Message-ID: <7b4bdbc9-9c68-c5c8-3f01-6a966c004a14@redhat.com>
Date:   Wed, 27 Jul 2022 22:52:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 11/15] Documentation/ABI/testing/sysfs-amd-pmf: Add ABI
 doc for AMD PMF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220712145847.3438544-1-Shyam-sundar.S-k@amd.com>
 <20220712145847.3438544-12-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220712145847.3438544-12-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/12/22 16:58, Shyam Sundar S K wrote:
> AMD PMF driver provides the flexibility to turn "on" or "off"
> CnQF feature (introduced in the earlier patch).
> 
> Add corresponding ABI documentation for the new sysfs node.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>  Documentation/ABI/testing/sysfs-amd-pmf | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-amd-pmf
> 
> diff --git a/Documentation/ABI/testing/sysfs-amd-pmf b/Documentation/ABI/testing/sysfs-amd-pmf
> new file mode 100644
> index 000000000000..5935dc549185
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-amd-pmf
> @@ -0,0 +1,11 @@
> +What:		/sys/devices/platform/AMDI0102\:00/cnqf/feat
> +Date:		July 2022
> +Contact:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +Description:	Reading this file tells if the AMD Platform Management(PMF)
> +		Cool n Quiet Framework(CnQF) feature is enabled or not.
> +
> +		This feature is not enabled by default and gets only turned on
> +		if OEM BIOS passes a "flag" to PMF ACPI function (index 11 or 12)
> +		or in case the user writes "on".
> +
> +		To turn off CnQF user can write "off" to the sysfs node.

