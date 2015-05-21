From: Darren Hart <dvhart@infradead.org>
Subject: Re: randconfig build error with next-20150521, in
 drivers/platform/x86/dell-rbtn.c
Date: Thu, 21 May 2015 21:56:15 +0200
Message-ID: <20150521195615.GF22037@vmdeb7>
References: <CA+r1Zhij2wUuLK6cdhr44NFW+okW4YuyFoo2_58mR6yncsXo3w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CA+r1Zhij2wUuLK6cdhr44NFW+okW4YuyFoo2_58mR6yncsXo3w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jim Davis <jim.epost@gmail.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, pali.rohar@gmail.com, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Thu, May 21, 2015 at 10:36:15AM -0700, Jim Davis wrote:
> Building with the attached random configuration file,
> 
> drivers/built-in.o: In function `rbtn_remove':
> dell-rbtn.c:(.text+0x31d7f4): undefined reference to `input_unregister_device'
> drivers/built-in.o: In function `rbtn_notify':
> dell-rbtn.c:(.text+0x31d8e5): undefined reference to `input_event'
> dell-rbtn.c:(.text+0x31d8f8): undefined reference to `input_event'
> dell-rbtn.c:(.text+0x31d911): undefined reference to `input_event'
> dell-rbtn.c:(.text+0x31d924): undefined reference to `input_event'
> drivers/built-in.o: In function `rbtn_add':
> dell-rbtn.c:(.text+0x31da11): undefined reference to `input_allocate_device'
> dell-rbtn.c:(.text+0x31da4a): undefined reference to `input_register_device'
> dell-rbtn.c:(.text+0x31da5e): undefined reference to `input_free_device'
> Makefile:938: recipe for target 'vmlinux' failed


Thanks Jim,

Pali, the DELL_RBTN needs to ensure if it it's built-in, that INPUT is too.
...
> CONFIG_INPUT=m
> CONFIG_INPUT_FF_MEMLESS=m
> CONFIG_INPUT_POLLDEV=m
> CONFIG_INPUT_SPARSEKMAP=m
> CONFIG_INPUT_MATRIXKMAP=m
...
> CONFIG_DELL_RBTN=y

Please submit a fix as a new patch.

-- 
Darren Hart
Intel Open Source Technology Center
