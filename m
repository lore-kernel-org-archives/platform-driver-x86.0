Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64687C6FD1C
	for <platform-driver-x86@archiver.kernel.org>; Wed, 22 Mar 2023 21:38:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjCVViH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 22 Mar 2023 17:38:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229833AbjCVViH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 17:38:07 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF1EE113E0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 14:38:05 -0700 (PDT)
Received: from [192.168.0.31] (51b68d67.dsl.pool.telekom.hu [::ffff:81.182.141.103])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000708EA.00000000641B753C.00156EF6; Wed, 22 Mar 2023 22:38:03 +0100
Message-ID: <18bc1c18-b384-095c-a15c-7272554f478e@irl.hu>
Date:   Wed, 22 Mar 2023 22:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] platform/x86: Add driver for Yoga Tablet Mode switch
Content-Language: en-US, hu
To:     Andrew Kallmeyer <kallmeyeras@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com
References: <20221004214332.35934-1-soyer@irl.hu>
 <20230310041726.217447-1-kallmeyeras@gmail.com>
 <20230310041726.217447-3-kallmeyeras@gmail.com>
 <85e87867-5001-da05-dd7c-020977c75288@irl.hu>
 <CAG4kvq8=nHL49_U6=fc0eNPptzX-deXvg=XnmgKC1cAMHP3iMQ@mail.gmail.com>
 <ba4e7835-9c13-89dc-cd3f-80ca90024639@irl.hu>
 <CAG4kvq_RokL99_X1fwTKM2w6otF1rjBzvp6PTUGn=q0ZmopXuA@mail.gmail.com>
From:   Gergo Koteles <soyer@irl.hu>
In-Reply-To: <CAG4kvq_RokL99_X1fwTKM2w6otF1rjBzvp6PTUGn=q0ZmopXuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 2023. 03. 22. 22:03, Andrew Kallmeyer wrote:
> On Wed, Mar 22, 2023 at 1:39 PM Gergo Koteles <soyer@irl.hu> wrote:
>>
>> According to Hans, it's unrealistic that Lenovo will change this
>> triggering behavior, so it can remain.
> 
> In that case I will leave you as the module and commit author but add
> your signed-off, unless you'd still prefer not to be the module
> author. You wrote most of this code, I only did a few code review
> changes :)

Alright.

