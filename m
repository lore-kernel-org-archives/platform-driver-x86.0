From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 3/3] platform//x86/pcengines-apuv2: update gpio button
 definition
Date: Mon, 8 Jul 2019 21:27:57 +0200
Message-ID: <add03c08-da1c-20f4-8d07-8ba2ecaf605c@metux.net>
References: <20190704090205.19400-1-fe@dev.tdt.de>
 <20190704090205.19400-4-fe@dev.tdt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190704090205.19400-4-fe@dev.tdt.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, Eckert.Florian@googlemail.com, info@metux.net, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 04.07.19 11:02, Florian Eckert wrote:
> * Add the gpio number, so the button subsystem can find the right gpio.
> * Change also the keycode from KEY_SETUP to KEY_RESTART, because it
>   seems more expressive to me and in the Alix-Board, which is the
>   predecessor, there isthis keycode defined too. I think this is also
>   intended by Pcengines. Also many embedded systems defined in the kernel
>   use this key code as well.

In general, I'm not opposed to that, but I'll first have to check trough
various userland code to make sure that it doesn't break
anything in the field, before I can give my ack.


--mtx

-- 
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
