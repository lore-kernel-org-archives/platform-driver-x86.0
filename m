From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH 3/3] platform/wmi: Expose the raw WDG data in sysfs
Date: Tue, 1 Aug 2017 23:36:18 +0200
Message-ID: <20170801213618.GL25574@pali>
References: <cover.1501601667.git.luto@kernel.org>
 <20170801204040.GH25574@pali>
 <20170801211702.GF3110@fury>
 <2014962.u6moyPZATx@aspire.rjw.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:35725 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751981AbdHAVgV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 1 Aug 2017 17:36:21 -0400
Content-Disposition: inline
In-Reply-To: <2014962.u6moyPZATx@aspire.rjw.lan>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Darren Hart <dvhart@infradead.org>, Andy Lutomirski <luto@kernel.org>, platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org

On Tuesday 01 August 2017 23:20:10 Rafael J. Wysocki wrote:
> No evaluation of AML methods from user space, please.
> 
> This is plain dangerous, because you never know what those things do and doing
> that on production systems is just a plain "no".
> 
> You can, however, expose the output of AML methods this way or another,
> for example if they are expected to generate packages of data or similar.
> 
> The interface for that cannot be "evaluate this random method right now and
> give me the result", though.

It is not a random AML method. It is _WDG buffer which wmi.ko already
reads + parse (IIRC only once when doing initialization) and purpose is
to provide copy of this buffer also to userspace. Similarly like
wmi-bmof.ko provides MOF buffer.

-- 
Pali Rohár
pali.rohar@gmail.com
