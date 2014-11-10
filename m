From: Darren Hart <dvhart@infradead.org>
Subject: Re: randconfig build error with next-20141110, in drivers/platform/x86/hp_accel.c
Date: Mon, 10 Nov 2014 09:19:15 -0800
Message-ID: <56A55F6D-4EA5-4A54-8727-97D3E4A875A5@infradead.org>
References: <CA+r1Zhio+KeBH0FFHwj=_fTFjqzebeE7Y2O_vsvMco49Sp56jw@mail.gmail.com> <5460EF02.3000904@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-next-owner@vger.kernel.org>
In-Reply-To: <5460EF02.3000904@gmail.com>
Sender: linux-next-owner@vger.kernel.org
To: Giedrius Statkevicius <giedrius.statkevicius@gmail.com>, Jim Davis <jim.epost@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, eric.piel@tremplin-utc.net, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org



On November 10, 2014 8:59:46 AM PST, Giedrius Statkevicius <giedrius.statkevicius@gmail.com> wrote:
>Hi Jim,
>
>On 2014.11.10 18:20, Jim Davis wrote:
>> Building with the attached random configuration file,
>> 
>> drivers/built-in.o: In function `lis3lv02d_remove':
>> /home/jim/linux/drivers/platform/x86/hp_accel.c:389: undefined
>> reference to `i8042_remove_filter'
>> drivers/built-in.o: In function `lis3lv02d_add':
>> /home/jim/linux/drivers/platform/x86/hp_accel.c:370: undefined
>> reference to `i8042_install_filter'
>> make: *** [vmlinux] Error 1
>> 
>
>Oops, sorry. Forgot to add a depend on i8042 per this patch in Kconfig:
>https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git/commit/?id=a4c724d0723b078e4ab4670e557cda1795036a7a
>
>This patch should fix it. After applying and using your .config I
>compiled the kernel without those undefined references. Should I make a
>new thread where it's submitted in the proper form? 

Yes please.


-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
