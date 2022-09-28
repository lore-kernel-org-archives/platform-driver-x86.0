Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E8B8C32771
	for <platform-driver-x86@archiver.kernel.org>; Wed, 28 Sep 2022 09:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233542AbiI1Jyp (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 28 Sep 2022 05:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233629AbiI1JyR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Sep 2022 05:54:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F4FD5777
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 02:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664358777;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=x2xFUdcVDWsoKQ6dRV/lMVVHVLWuHfpAMF2LfPYKj1M=;
        b=iebKwHTWdQdHS/s/Q5BAK4PWdrz0HPLP/9OdNdJY8JIIeXE2nxqDCzck/Hut30AZdp6Iop
        J0yG5wTznKtbZjFJyEYQf1fVf+lTR4JxVLfJkROhZBhC53aAMX5Y5Irt4pJ6pcWjrGzSxu
        XIn0/3eT+UQsClNHMvfG0vNqHAt3KkA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-384-KKWJ3kVIPHiw81jfS3_n8w-1; Wed, 28 Sep 2022 05:52:55 -0400
X-MC-Unique: KKWJ3kVIPHiw81jfS3_n8w-1
Received: by mail-ej1-f69.google.com with SMTP id sb34-20020a1709076da200b00783a5f786easo4079111ejc.22
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Sep 2022 02:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=x2xFUdcVDWsoKQ6dRV/lMVVHVLWuHfpAMF2LfPYKj1M=;
        b=M1AmtDd7KeOBn9Z49zNAYbYWx52P7U46FetRKc0NmNziT28Q4S7dpR+qubNSybLA1t
         huFHaKtrCRZlQUYrHwifPgY51ud3zfNE5gQbVdFMinD8jlTZuWFP2Vv8p5H308V81609
         kb6CgNheiYatRldIffof8C8vntJBWJwx5Cg5o9jz1YXwKNyRq92Q/V4/AWD5pilICioI
         1qj42seV3N3LYDkZVIeQy79+Wnwobw6p+VNNMKPPfDJ1epzRU5WR8mYxYKQ4XgNObE0P
         97DG3KmpNyzwNa7IRRIgArnDJArSSB11bgTnPbWgT91l99rzYhk3BFq4QH+3Qbk3/OEq
         9ciA==
X-Gm-Message-State: ACrzQf04AUKw6IZQxSwua46xOEEK/Nb0+Z+zodOu6FTYs62ua2XZ2Zi9
        zuG4DrDJNn0cJTojVdQC5QHQUQGmXggscEgARKz5ooDv7YRr7xyEveDeXa2SwjfuJNW1G6/tjGn
        vOllR2loIu2QegzFz95vrY1MaHFx64AkCiw==
X-Received: by 2002:a17:907:6ea4:b0:782:6b82:a2cb with SMTP id sh36-20020a1709076ea400b007826b82a2cbmr25723789ejc.408.1664358774446;
        Wed, 28 Sep 2022 02:52:54 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4oAVfbH8bkInJRKLy2wfctW0MQ7NUYV8Dm4/aSxllHGsGY1mgLQX++4sFEEm8nKEUEy6HMhA==
X-Received: by 2002:a17:907:6ea4:b0:782:6b82:a2cb with SMTP id sh36-20020a1709076ea400b007826b82a2cbmr25723778ejc.408.1664358774260;
        Wed, 28 Sep 2022 02:52:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f20-20020a50ee94000000b004482dd03fe8sm2967121edr.91.2022.09.28.02.52.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 02:52:52 -0700 (PDT)
Message-ID: <8d976e9c-8fea-8a67-1331-7993705c60d9@redhat.com>
Date:   Wed, 28 Sep 2022 11:52:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 0/2] platform/x86: dell: Add new dell-wmi-ddv driver
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, hmh@hmh.eng.br,
        matan@svgalib.org, corentin.chary@gmail.com, jeremy@system76.com,
        productdev@system76.com, mario.limonciello@amd.com,
        pobrn@protonmail.com, coproscefalo@gmail.com,
        platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220927204521.601887-1-W_Armin@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220927204521.601887-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/27/22 22:45, Armin Wolf wrote:
> This patch series adds a new driver for a WMI interface found in
> many newer Dell machines. This interface allows to read battery
> properties like temperature and the ePPID (Dell-specific), while
> also providing fan and thermal sensor information.
> 
> The interface does support multiple batteries which are indentified
> by an "index", which appears to be the battery ACPI UID. Since
> the interface also appears to omit any bounts checking of the
> index, the ACPI battery hook mechanism is used to discover batteries.
> 
> Since the information returned when querying fan/thermal sensor
> information is currently unknown, a debugfs entry is created to
> allow for easier reverse engineering. The interface is likely
> to be replaced by a proper hwmon interface in the future.
> 
> Since the driver can potentially be instantiated multiple times,
> the ACPI battery hook mechanism had to be extended.
> 
> The first patch passes a pointer to the battery hook to the
> hook callbacks, so that they can access instance-specific data
> with container_of().
> 
> The second patch finally adds the new driver. It was called
> dell-wmi-ddv since the interface is called "DDV" by Dell software,
> likely meaning "Dell Data Vault".
> 
> The driver was tested, together with the changes made to the
> ACPI battery driver, on a Dell Inspiron 3505. Other drivers
> already using the battery hook mechanism where changed as well,
> but could only be compile-tested due to missing hardware.
> 
> ---
> Changes in v2:
> - Significantly lower the amount of changes being made to the
> acpi battery driver
> - drop unnecessary ABI description of the temp attribute
> - return 0 when a unsupported battery is found to avoid being
> unloaded
> 
> Armin Wolf (2):
>   ACPI: battery: Pass battery hook pointer to hook callbacks
>   platform/x86: dell: Add new dell-wmi-ddv driver

Thanks.

The new version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

for the series.

Rafael, from my POV this can be merged through either your
tree or mine. Feel free to merge this through your tree,
or please give your Ack for merging through mine
(assuming you are ok with the changes of course).

Regards,

Hans

