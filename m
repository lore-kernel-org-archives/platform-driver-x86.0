Return-Path: <SRS0=GDfv=DA=vger.kernel.org=platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73668C2D0A8
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 10:19:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 235DB2076E
	for <platform-driver-x86@archiver.kernel.org>; Wed, 23 Sep 2020 10:19:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BbAmWtNy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726415AbgIWKTl (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 23 Sep 2020 06:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36965 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726130AbgIWKTl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 06:19:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600856379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZfmXFWuGpvjNq6cXHlDm0b2WUaUCEmp6aIcoRmPsQQc=;
        b=BbAmWtNy7CvX6u+ynwAQMPL5vMmhBaplOyAifeskM1P4o4UnajI7C6yrI0rKLrnBvohqS5
        0FBHNNc6GfjCwKyQom7HmQGTnJSds5hHZqjITreMJexx+1LLPe4L/YVyNrbX8I2eZ0nRk+
        DkKSq7GPtCh64lCyXd+foZBXxFgjfDw=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-8NT6I3W6Ne6Q3npVZpMUCA-1; Wed, 23 Sep 2020 06:19:37 -0400
X-MC-Unique: 8NT6I3W6Ne6Q3npVZpMUCA-1
Received: by mail-ej1-f72.google.com with SMTP id f17so7352246ejq.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Sep 2020 03:19:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZfmXFWuGpvjNq6cXHlDm0b2WUaUCEmp6aIcoRmPsQQc=;
        b=CG8sZL4lWeD3x29L+4Fz+Ig/jCBIoUgwMSERmooLHuBV4bYw/ExIqocbwfnnMLscPO
         IMarvr7eJ/z33CvqEdVvL3DGxAl7yNgqvUPAXWcvh1w9X+FxMlc9iF4mnBgu33SPus+f
         Lx5AtPVEDiMT2DT67f803sOtRomixU4zPUcPmEEAgfEdeLUaA0USik1ejiOgZSSWxpAq
         LoBuXRGDva6qrNKe4hBcsNp8gFERg13WEBi29bJoN50Wwt+u/DP6ciQ62MX3sBnnO6Cl
         KemNbyDQA6v+VllRlbEnXTHLvYH61TdkJiBkVnXGBsmR6pePd6v2wXgt4kvuOHjaiU+e
         QaeA==
X-Gm-Message-State: AOAM531g8nOHMYgyp1JLwZOoY76MyH+27VuDvx91lWSwnssk68MqbUEs
        M17wRsRKtL+YPZeY+SsRGpSPhfbzeg2ghla5LAWljr6f7UfYO3sfWV0GDSPJe+6dK6tVQ42ihM2
        h+Q/ZFKjHFocKesJt3tZWqnj/rRcJUIAJ7Q==
X-Received: by 2002:a17:906:9353:: with SMTP id p19mr9413566ejw.403.1600856376405;
        Wed, 23 Sep 2020 03:19:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPVx89V1eZbL5cxLXVTc+ANFBUKj6JBoKaRNLXiNnkex3L0pvdHrP2XVqk/yRifa5pnN5u4A==
X-Received: by 2002:a17:906:9353:: with SMTP id p19mr9413545ejw.403.1600856376072;
        Wed, 23 Sep 2020 03:19:36 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id cn21sm13784997edb.14.2020.09.23.03.19.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2020 03:19:35 -0700 (PDT)
Subject: Re: [PATCH v3] Introduce support for Systems Management Driver over
 WMI for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        mark gross <mgross@linux.intel.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200917065550.127400-1-divya_bharathi@dell.com>
 <2795ca15-59b1-8435-14ef-6e0c1d532b22@redhat.com>
 <DM6PR19MB26361E423C4430923850E1DCFA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <15cedffb-a0a3-a52a-fb6c-cdb674dc0972@redhat.com>
Date:   Wed, 23 Sep 2020 12:19:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26361E423C4430923850E1DCFA3A0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/20 8:23 PM, Limonciello, Mario wrote:
>>
>>> +
>>> +		"integer"-type specific properties:
>>> +
>>> +		min_value:	A file that can be read to obtain the lower
>>> +		bound value of the <attr>
>>> +
>>> +		max_value:	A file that can be read to obtain the upper
>>> +		bound value of the <attr>
>>> +
>>> +		scalar_increment:	A file that can be read to obtain the
>>> +		resolution of the incremental value this attribute accepts.
>>> +
>>> +		"string"-type specific properties:
>>> +
>>> +		max_length:	A file that can be read to obtain the maximum
>>> +		length value of the <attr>
>>> +
>>> +		min_length:	A file that can be read to obtain the minimum
>>> +		length value of the <attr>
>>> +
>>> +What:		/sys/devices/platform/dell-wmi-sysman/passwords/
>>> +Date:		December 2020
>>> +KernelVersion:	5.10
>>> +Contact:	Divya Bharathi <Divya.Bharathi@Dell.com>,
>>> +		Mario Limonciello <mario.limonciello@dell.com>,
>>> +		Prasanth KSR <prasanth.ksr@dell.com>
>>> +
>>> +		A BIOS Admin password and System Password can be set, reset or
>>> +		cleared using these attributes. An "Admin" password is used for
>>> +		preventing modification to the BIOS settings. A "System" password
>> is
>>> +		required to boot a machine.
>>> +
>>> +		is_password_set:	A file that can be read
>>> +		to obtain flag to see if a password is set on <attr>
>>> +
>>> +		max_password_length:	A file that can be read to obtain the
>>> +		maximum length of the Password
>>> +
>>> +		min_password_length:	A file that can be read to obtain the
>>> +		minimum length of the Password
>>> +
>>> +		current_password: A write only value used for privileged access
>>> +		such as setting attributes when a system or admin password is set
>>> +		or resetting to a new password
>>> +
>>> +		new_password: A write only value that when used in tandem with
>>> +		current_password will reset a system or admin password.
>>> +
>>> +		Note, password management is session specific. If Admin/System
>>> +		password is set, same password must be writen into current_password
>>> +		file (requied for pasword-validation) and must be cleared once the
>>> +		session	is over. For example,
>>> +			echo "password" > current_password
>>> +			echo "disabled" > TouchScreen/current_value
>>> +			echo "" > current_password
>>
>> So I know this was mentioned before already but one concern I have here
>> is that there is a race where other users with write access to say
>> TouchScreen/current_value
>> may change it between the setting and the clearing of the current_password
>> even if
>> they don't have the password.
> 
> I don't think there is much that can be done here other than move to something atomic
> like sending the password as part of the request.

Right, I'm not saying this scheme is bad per se I just wanted to make
sure that this was brought up and discussed.

> echo "foobar123|enabled" | sudo tee /sys/devices/platform/dell-wmi-sysman/
> 
> That isn't really pretty - and worse you can no longer have a process fetching
> authentication from escrow that is different from your "setter" process.

Note you will likely need some form of IPC, say dbus to your escrow process
anyways to ask it to unlock. So you could just change the "unlock" request
to a "set Camera=Enabled" request and have the process which has access
to the authentication token make the changes itself.

>> This is esp. relevant with containers. I'm not aware about all the intrinsics
>> of
>> sysfs and containers, at a minimum we need to check if it is possible to
>> disallow
>> all writes to the attributes when sysfs is mounted inside a container (so
>> outside of the
>> main filesystem namespace).
> 
> Containers by default mount sysfs as read only unless you use the '--privileged'
> flag.
> 
> https://www.redhat.com/sysadmin/privileged-flag-container-engines

Thanks that is good to know and does address most of my concerns. What I was
wondering about is if we can enforce this in the kernel even for --privileged
containers.  I guess another question would be if we can do that, should we?

Regards,

Hans

