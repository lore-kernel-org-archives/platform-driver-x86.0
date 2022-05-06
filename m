Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCB3C433F5
	for <platform-driver-x86@archiver.kernel.org>; Fri,  6 May 2022 18:42:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378813AbiEFSpx (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 6 May 2022 14:45:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356880AbiEFSpv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 May 2022 14:45:51 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0AF2555357
        for <platform-driver-x86@vger.kernel.org>; Fri,  6 May 2022 11:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651862527;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IutWs/AAIWN2kdaL06tOXzC11yEkd5/tsS3ZCS9FxNc=;
        b=czzXSxW9WFEiN4AAABrc2nbO1WASvfVxKBEM7iPPoPTkMemDjf15paDJksDyKWGEsl2Mca
        sJTUjsRC7NO/6iq2sfZwXmVCyV54DUAQfoLPn68z0tiD+SbxuVxNYD8NEH5EZlD/ODLVWR
        hUHECDBLDUAszqhFnFsF5MPo02c+Fc0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-GekrzY20PmuNcuKg2vTVMA-1; Fri, 06 May 2022 14:42:04 -0400
X-MC-Unique: GekrzY20PmuNcuKg2vTVMA-1
Received: by mail-ej1-f72.google.com with SMTP id sd38-20020a1709076e2600b006f3e54b1dbcso2900731ejc.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 May 2022 11:42:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=IutWs/AAIWN2kdaL06tOXzC11yEkd5/tsS3ZCS9FxNc=;
        b=fmZ5Onanq3jfJSrjUrZ3jGtalRv633RR4Ot5SFhez5p8EtoTCuZ1q4CwJixthCGIEp
         0pCfw1yemP21R++0Ozl+vrdeVGYDIw8FFiRlsRbzJ+fSOaRR54PNoLS7qCHGEUwPpYck
         ub2yA8Iaul4V9yNZsHCh9ztwZEYXPlcCFLl0oJr13z72QIeiqrCaoeHvHHzaFK8DH9E3
         u2JFZZpuB6o0sn9xJ1jbGVMhjvZ/6jLodjl9GmgfgreR6J9vARHeivKZ6zl6k/z0Y/ii
         vP4Z4o1+puB/++XTsG2N+Dii+2g+g8zXWHWEwFs0TyAgIQUxPxWuQfvHBtCeG1tR0nEh
         O1ZQ==
X-Gm-Message-State: AOAM531hsQSxQYHoo7DFtbjPAEDJxf2K8O7iAStfrWuH+9EJA7c5DTpA
        3JiM2v18bjiUG/3dfVmtoR3TuL0hO/pJBQ/zddTCUOgf/2f1cO7OP7Br+QPR7HfOuhDEG91yD6K
        YSvJgKTi9otVSuddNifgFKviY/EJjpd4k4A==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr4098132ejc.66.1651862522983;
        Fri, 06 May 2022 11:42:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw++pW+zoYzTYOHGCeDdAFw8juVOYeKHg0KEBZ0ZNL6LniqL5SEZeYX9EZMh6IEZI9oT6xsJg==
X-Received: by 2002:a17:907:9605:b0:6f5:c66:7c13 with SMTP id gb5-20020a170907960500b006f50c667c13mr4098108ejc.66.1651862522821;
        Fri, 06 May 2022 11:42:02 -0700 (PDT)
Received: from [192.168.43.126] ([109.38.131.108])
        by smtp.gmail.com with ESMTPSA id ra48-20020a17090769b000b006f3ef214da0sm2227765ejc.6.2022.05.06.11.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 May 2022 11:42:02 -0700 (PDT)
Message-ID: <4fda831b-c132-53cd-cd75-4f46b45219ac@redhat.com>
Date:   Fri, 6 May 2022 20:41:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v5 00/10] Introduce In Field Scan driver
Content-Language: en-US
To:     "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc:     "markgross@kernel.org" <markgross@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "Williams, Dan J" <dan.j.williams@intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>
References: <20220422200219.2843823-1-tony.luck@intel.com>
 <20220428153849.295779-1-tony.luck@intel.com>
 <13054c5c-ed48-b7a2-a800-25b9b1b1ab0d@redhat.com> <YnFK+gXFx0jQB1dz@zn.tnic>
 <b18234d7-a1f4-d5a4-e59b-f5439c38c2d0@redhat.com>
 <15cca88b82cd46a3a2a98b7cf336a6ed@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <15cca88b82cd46a3a2a98b7cf336a6ed@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/6/22 17:53, Luck, Tony wrote:
>> I'll give it some more time for review for v6 and then pick up v6
>> (or v7 if review leads to more changes).
> 
> Hans,
> 
> Thomas has found one substantive problem, and a few minor things (so far ... he
> still seems to be working through v6). 

Ok.

> So there will be a v7. Likely early next week. Is that OK?

That is fine.

> Do you still take patches after -rc6?

If the patches are send soon (1-2 days) after rc6 I can still take them.

Regards,

Hans

