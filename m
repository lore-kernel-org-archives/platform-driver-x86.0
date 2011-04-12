From: Ameya Palande <2ameya@gmail.com>
Subject: Re: [PATCH] platform-x86: intel_mid_thermal: Fix memory leak
Date: Tue, 12 Apr 2011 10:13:51 +0300
Message-ID: <BANLkTik00CfgnGW-+3T6=ZuNHz+5_stXVg@mail.gmail.com>
References: <1302183002-3900-1-git-send-email-2ameya@gmail.com>
	<D6D887BA8C9DFF48B5233887EF04654109516F23CC@bgsmsx502.gar.corp.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-vx0-f174.google.com ([209.85.220.174]:52175 "EHLO
	mail-vx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756734Ab1DLHNw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 12 Apr 2011 03:13:52 -0400
Received: by vxi39 with SMTP id 39so4669307vxi.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2011 00:13:51 -0700 (PDT)
In-Reply-To: <D6D887BA8C9DFF48B5233887EF04654109516F23CC@bgsmsx502.gar.corp.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "mjg@redhat.com" <mjg@redhat.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "R, Durgadoss" <durgadoss.r@intel.com>

Hi Matthew,

On Thu, Apr 7, 2011 at 4:49 PM, R, Durgadoss <durgadoss.r@intel.com> wrote:
>> -----Original Message-----
>> From: Ameya Palande [mailto:2ameya@gmail.com]
>> Sent: Thursday, April 07, 2011 7:00 PM
>> To: platform-driver-x86@vger.kernel.org
>> Cc: mjg@redhat.com; R, Durgadoss
>> Subject: [PATCH] platform-x86: intel_mid_thermal: Fix memory leak
>>
>> Signed-off-by: Ameya Palande <2ameya@gmail.com>
>> ---
>
> Acked-by: Durgadoss R <durgadoss.r@linux.intel.com>

Can this patch go in for 2.6.39-rc4?

Cheers,
Ameya.
