Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AC2BC07E96
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Jul 2021 14:20:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3CF2361456
	for <platform-driver-x86@archiver.kernel.org>; Thu,  8 Jul 2021 14:20:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231931AbhGHOXP (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 8 Jul 2021 10:23:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28599 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229592AbhGHOXO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jul 2021 10:23:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625754032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rMd4AWjD6adpOD0cHBKiOHOCr1xW7T6v5/60Gt2npvY=;
        b=Lap068H0hVfEmXUgBDxH53nx6UCfyvmrc5QPyvPekxTtLWox5NubDg8qm1heeNIesqxObP
        YxYmbQIfOz4kyTv0tbASqABYKG/ByZscpSSvVZ+lBhCmgZlKpJXfPmPIFECi72LC7G+cG6
        jPBAKIGQr9E8TOFjMCkqxYmaAcQMO4Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-579-0O7YmhhvOWKUwtckCMk2pg-1; Thu, 08 Jul 2021 10:20:31 -0400
X-MC-Unique: 0O7YmhhvOWKUwtckCMk2pg-1
Received: by mail-ej1-f71.google.com with SMTP id de27-20020a1709069bdbb02904dedfc43879so1893622ejc.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Jul 2021 07:20:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rMd4AWjD6adpOD0cHBKiOHOCr1xW7T6v5/60Gt2npvY=;
        b=XwxAlwPMwAEnouJAiQE8CWrB+PW2jtdvDW5y7PgdSOBLVPCMl5O7vCcdJT5a2kv7qy
         Vzi7UDdHwg1MqMMfxl+YPmR0Jn3kmIYXnwiaOCHdeaZt8ju09Q5eTIAWmUgO8hEFVQYa
         4LhqbdqWSXucnLw+PSniX5GL7GEu+rGhtc2kguTG9sHZu+xJlfQR+L0SPi2tTiei+jy4
         ltvdqvQ/2Qjx0Ga1uVCwi5yV9xId12yEzEcus5R82qyrc4UEK099xvPQOfNvVbRM2FuZ
         fK8XO1Ha9Lbcj8o6HTu6Ja7Pdfkbdu6wdbJbMkl3b+v6CcEeMHubSogOgWw1182StB5F
         /bbg==
X-Gm-Message-State: AOAM5315Cp5KVRhJBPdh+YrCqsS5Em8dfgDUKzcYI1G1B1///bM6dRG/
        ZU6BKLkKSfIS5wvap7pM2uMWl+p6NfWlPoxIbYwnVimI5Hi6LeGEqrHVpQHoo5FXMgC3//1g6Tv
        RScZTo56D6kUIrUGW/LWmHcpDTaqVObBCVw==
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr30157999ejf.383.1625754030234;
        Thu, 08 Jul 2021 07:20:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz+CRFaKbiL2TI3Vd12pHECJc8QTdAdXLv8YYfZAUALlnriDC30i16VBgmVrmOvk7uIBlhUxw==
X-Received: by 2002:a17:906:31d4:: with SMTP id f20mr30157971ejf.383.1625754030111;
        Thu, 08 Jul 2021 07:20:30 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id aq6sm1011569ejc.77.2021.07.08.07.20.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jul 2021 07:20:29 -0700 (PDT)
Subject: Re: [PATCH v2 1/6] x86/tdx: Add TDREPORT TDX Module call support
To:     "Kuppuswamy, Sathyanarayanan" 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Xiaoyao Li <xiaoyao.li@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Mark Gross <mgross@linux.intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>
Cc:     Peter H Anvin <hpa@zytor.com>, Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org
References: <20210707204249.3046665-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210707204249.3046665-2-sathyanarayanan.kuppuswamy@linux.intel.com>
 <d9aac97c-aa08-de9f-fa44-91b7dde61ce3@intel.com>
 <46944ac2-4841-7f1d-4f54-ecb477f43d63@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <20c227e0-1299-0bf8-690c-f0260d39f420@redhat.com>
Date:   Thu, 8 Jul 2021 16:20:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <46944ac2-4841-7f1d-4f54-ecb477f43d63@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/8/21 4:07 PM, Kuppuswamy, Sathyanarayanan wrote:
> 
> 
> On 7/8/21 1:16 AM, Xiaoyao Li wrote:
>>
>> Sorry I guess I didn't state it clearly during internal review.
>>
>> I suggest something like this
>>
>> if (ret != TDCALL_SUCCESS) {
>>      if (TDCALL_RETURN_CODE(ret) == TDCALL_INVALID_OPERAND)
>>          return -EINVAL;
>>      else if (TDCALL_RETURN_CODE(ret) == TDCALL_OPERAND_BUSY)
>>          return -EBUSY;
>>      else
>>          return -EFAULT; //I'm not sure if -EFAULT is proper.
>> }
> 
> As per current spec, TDCALL_INVALID_OPERAND, TDCALL_OPERAND_BUSY and
> 0 are the only possible return values. So I have checked for failure case
> in if condition and returned success by default. Any reason for specifically
> checking for success code ?

Yes, new error codes might be introduced and you might forget to
update this (or other) checks.

Checking for errors really MUST always be done by checking for
ret != success (typically ret != 0 or ret < 0).

Only checking for known error codes means that if somehow an
unknown error code gets thrown this gets treated as success,
which is not acceptable behavior.

Regards,

Hans


