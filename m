From: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 1/1] platform/x86: revert pcengines-apuv2 wire up
 simswitch gpio as led
Date: Fri, 31 Jul 2020 16:01:45 +0200
Message-ID: <e95c8b76-cfaf-4d49-aa93-525093e61e03@metux.net>
References: <20200713085010.26394-1-fe@dev.tdt.de>
 <6def788e-f2f8-da80-b189-56ae4630440f@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <6def788e-f2f8-da80-b189-56ae4630440f@metux.net>
Content-Language: tl
Sender: linux-kernel-owner@vger.kernel.org
To: Florian Eckert <fe@dev.tdt.de>, info@metux.net, vhart@infradead.org, andy@infradead.org, Eckert.Florian@googlemail.com
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On 31.07.20 15:45, Enrico Weigelt, metux IT consult wrote:

Addendum: there's even more functionality we'll loose

Individual LED lines can be made available to specific
unprivileged users / processes, eg. chmod or passing fd's.

For example, allowing a web application to pull the switch,
w/o ever becoming root. And that's indeed a practial use case,
which is used in the field.

--mtx


> On 13.07.20 10:50, Florian Eckert wrote:
> 
> Hello Florian,
> 
>> This reverts commit 5037d4ddda31c2dbbb018109655f61054b1756dc.
> 
> no, please dont.
> 
>> This change connects the simswap to the LED subsystem of the kernel.
>> From my point of view, it's nonsense. If we do it this way, then this
>> can be switched relatively easily via the LED subsystem (trigger:
>> none/default-on) and that is dangerous! If this is used, it would be
>> unfavorable, since there is also another trigger (trigger:
>> heartbeat/netdev).
> 
> I don't think that potential silly abuse is a good argument. It if
> would, we should also disallow things like "echo FOO > /dev/sda" :p
> 
> The reason for it wire'ing up was having an simple and easy to use
> interface. Raw gpios do NOT meet this criteria: complicated to use and
> not stable addressing (from userland PoV) - would require an extra
> userland program just for that single specific task.
> 
> Yes, LED is not the optimal approach, same for other gpio-connected
> switches, eg. relais or various multiplexers. But as long as we don't
> have a really fitting subsystem, it's IMHO the best compromise we have
> so far.
> 
> Actually, I've already been hacking on a better subsystem, which models
> switchable inter-device connections. It's called portmux. But it's not
> usable yet. Lets talk about this instead of just wildly dropping
> existing functionality, that's used in the field.
> 
> 
> --mtx
> 

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
