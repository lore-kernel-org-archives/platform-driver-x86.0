From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH] platform/x86: pcengines-apu2: fix simswap gpio assignment
Date: Thu, 12 Dec 2019 12:23:29 +0100
Message-ID: <79f8f45f-98a7-c2c6-068d-82e339d8be46@metux.net>
References: <20191212111507.14365-1-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191212111507.14365-1-info@metux.net>
Content-Language: tl
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>, linux-kernel@vger.kernel.org
Cc: platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On 12.12.19 12:15, Enrico Weigelt, metux IT consult wrote:
> The mapping entry has to hold the gpio line index instead of
> controller's register number.
> 
> Fixes: 5037d4ddda31c2dbbb018109655f61054b1756dc

Sorry, got the Fixes line wrong again ... forgot to fix my scripts :o

I'll repost in a few seconds.


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
