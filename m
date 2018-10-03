From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: linux-next: Tree for Oct 2 (dell: dcdbas)
Date: Wed, 3 Oct 2018 11:00:44 +0300
Message-ID: <CAHp75VdU1u9VueXB+f68c5TA4QsxBNihv_VtWw2zPpWvehV1vQ@mail.gmail.com>
References: <20181002191818.1c2eec51@canb.auug.org.au> <b019c375-1157-778f-99b2-1d09aa4b4e6a@infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b019c375-1157-778f-99b2-1d09aa4b4e6a@infradead.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-next <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Stuart Hayes <stuart.w.hayes@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Oct 2, 2018 at 7:52 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 10/2/18 2:18 AM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20180928:
> >
>
> on i386 or x86_64:
>
>   CC      drivers/platform/x86/dcdbas.o
> ../drivers/platform/x86/dcdbas.c: In function 'dcdbas_check_wsmt':
> ../drivers/platform/x86/dcdbas.c:572:2: error: implicit declaration of function 'memremap' [-Werror=implicit-function-declaration]
>   eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
>   ^
> ../drivers/platform/x86/dcdbas.c:572:61: error: 'MEMREMAP_WB' undeclared (first use in this function)
>   eps_buffer = memremap(eps->smm_comm_buff_addr, remap_size, MEMREMAP_WB);
>                                                              ^
> ../drivers/platform/x86/dcdbas.c:572:61: note: each undeclared identifier is reported only once for each function it appears in
> ../drivers/platform/x86/dcdbas.c: In function 'dcdbas_exit':
> ../drivers/platform/x86/dcdbas.c:748:3: error: implicit declaration of function 'memunmap' [-Werror=implicit-function-declaration]
>    memunmap(eps_buffer);
>    ^
>
>
> Reported-by: Randy Dunlap <rdunlap@infradead.org>

Sorry for that. Arnd sent a fix and I'm going to apply it soon.

>
> --
> ~Randy



-- 
With Best Regards,
Andy Shevchenko
