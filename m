Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99D2C48BCD
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:27:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CB11D61354
	for <platform-driver-x86@archiver.kernel.org>; Wed,  9 Jun 2021 15:27:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236082AbhFIP3s (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 9 Jun 2021 11:29:48 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:22908 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233840AbhFIP3q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Jun 2021 11:29:46 -0400
Received: from [100.112.3.19] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 52/85-20778-6FDD0C06; Wed, 09 Jun 2021 15:27:50 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprGKsWRWlGSWpSXmKPExsWS8eIhr+63uwc
  SDLZ/07CYNOM/s8Xrf9NZLN4cn85k0bX2EKPF547JLBar97xgdmDzmN1wkcVj8wotj3knAz0+
  Pr3F4vF+31U2j8+b5ALYolgz85LyKxJYM9b9v8xWsJqj4s6lL4wNjH/Zuhg5OYQE/jNKTNhl0
  8XIBWQ/YpR49GASWEJYIEOi5dIXMFtEoFhi7Z+LzCBFzALtjBL/j61lgujOkXg58QwziM0moC
  2xZcsvsAZeAVuJ7rbZrCA2i4CKxMKPGxhBbFGBcIndHS+ZIGoEJU7OfMICYnMK2ElMOXIfqJ4
  DaIGmxPpd+iBhZgFxiVtP5jNB2PIS29/OAVslIaAocerNfSg7QaLn3yO2CYyCs5BMnYUwaRaS
  SbOQTFrAyLKK0TSpKDM9oyQ3MTNH19DAQNfQ0EjXWNfURC+xSjdJr7RYNzWxuETXUC+xvFivu
  DI3OSdFLy+1ZBMjMIpSCpjNdjD+fP1B7xCjJAeTkiivQ/2BBCG+pPyUyozE4oz4otKc1OJDjB
  ocHAJXDh6ZzSjFkpefl6okwVt5B6hOsCg1PbUiLTMHGOkwpRIcPEoivMHHgNK8xQWJucWZ6RC
  pU4yKUuK8GSB9AiCJjNI8uDZYcrnEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZg3H2QKT2Ze
  Cdz0V0CLmYAWOxrvA1lckoiQkmpgkoup3L4i/ljLs95lKVsTWjKem+w++faPThDfucrtP45en
  XE4PV7dv/cjh8PsrxoBbUXPHL+yqsTOPrxO9IWkyPYPiYe+NCQdnvTw8XqmqOscXRxr5iULT1
  b/JnE3KO4zM0PJtydPJF7dq6vr3hUhorCKr3Yr587Zj15MWeg7s0Xv1IMtBYZ+n88z5ZsXTzj
  rF/k5UiAi3ySOue7mj5TTx2J8D2doVaxNrE9Yte7IbqPgKOWZmYtNOH4tZl8e4uhjJVUT5RS+
  4fLG143PTq9Z7/FK6eHWiBt2cyadu7Ng+8fTIh1XfAVWTQ1lE1zivG+GgiODubvxIfG18kt6M
  zivRXFtvXc58c7DrXOznsTdD1FiKc5INNRiLipOBAB1x9HMqQMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-15.tower-396.messagelabs.com!1623252470!143126!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26530 invoked from network); 9 Jun 2021 15:27:50 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-15.tower-396.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 9 Jun 2021 15:27:50 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 74DAB6F2A4CE708BE58A;
        Wed,  9 Jun 2021 11:27:50 -0400 (EDT)
Received: from [10.46.192.169] (10.46.192.169) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Wed, 9 Jun 2021
 11:27:49 -0400
Subject: Re: [External] Re: [PATCH 1/2] platform/x86: think-lmi: Fix check for
 admin password being set
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
CC:     <platform-driver-x86@vger.kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        coverity-bot <keescook+coverity-bot@chromium.org>
References: <20210609151752.156902-1-hdegoede@redhat.com>
 <32058718-25e2-77c4-1881-29573e935150@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <d42df7f4-eb2c-3a24-ca98-c166d9ff3453@lenovo.com>
Date:   Wed, 9 Jun 2021 11:27:49 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <32058718-25e2-77c4-1881-29573e935150@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.169]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 2021-06-09 11:19 a.m., Hans de Goede wrote:
> Hi,
> 
> On 6/9/21 5:17 PM, Hans de Goede wrote:
>> tlmi_priv.pwd_admin->password is an array (not a pointer), so the correct
>> way to check for the password being set is to check for
>> tlmi_priv.pwd_admin->password[0] != 0.
>>
>> For the second check, replace the check with checking that auth_str is
>> set instead.
>>
>> Cc: Mark Pearson <markpearson@lenovo.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>> Reported-by: coverity-bot <keescook+coverity-bot@chromium.org>
>> Addresses-Coverity-ID: 1505158 ("NO_EFFECT")
>> Fixes: a7314b3b1d8a ("platform/x86: think-lmi: Add WMI interface support on Lenovo platforms")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> 
> I've added this series to my review-hans branch (soon to be pdx86/for-next) branch now.
> 
> Regards,
> 
> Hans
> 

Thanks Hans - I was just about to start looking at these. You're fast :)

I think you've fixed everything I saw flagged - let me know if there is
anything else I should look at and might have missed.

Mark
