From: =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
Subject: Re: [PATCH v6 01/11] intel_sgx: updated MAINTAINERS
Date: Sun, 26 Nov 2017 11:41:42 +0100
Message-ID: <87d145iaop.fsf@miraculix.mork.no>
References: <20171125193132.24321-1-jarkko.sakkinen@linux.intel.com>
        <20171125193132.24321-2-jarkko.sakkinen@linux.intel.com>
        <1511641182.2503.14.camel@perches.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from canardo.mork.no ([148.122.252.1]:47479 "EHLO canardo.mork.no"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751312AbdKZKmp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Nov 2017 05:42:45 -0500
In-Reply-To: <1511641182.2503.14.camel@perches.com> (Joe Perches's message of
        "Sat, 25 Nov 2017 12:19:42 -0800")
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>, platform-driver-x86@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>

Joe Perches <joe@perches.com> writes:
> On Sat, 2017-11-25 at 21:29 +0200, Jarkko Sakkinen wrote:
>> diff --git a/MAINTAINERS b/MAINTAINERS
> []
>> @@ -14932,6 +14932,11 @@ L:	linux-mm@kvack.org
>>  S:	Maintained
>>  F:	mm/zswap.c
>>=20=20
>> +INTEL SGX
>> +M:	Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
>> +L:	intel-sgx-kernel-dev@lists.01.org
>> +Q:	https://patchwork.kernel.org/project/intel-sgx/list/
>
> Alphabetical order please and this should
> have at least an "F:" pattern like:
>
> F:	drivers/platform/x86/intel_sgx/

FYI: Darren already requested that when reviewing v5:
https://www.spinics.net/lists/kernel/msg2651743.html



Bj=C3=B8rn
