From: =?utf-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>
Subject: Re: [PATCH 0/2] fujitsu-laptop: acpi_fujitsu_notify() cleanup
Date: Fri, 3 Feb 2017 15:08:25 +0100
Message-ID: <20170203140825.GC11947@ozzy.nask.waw.pl>
References: <20170117110735.2543-1-kernel@kempniu.pl>
 <20170117111935.GC22965@marvin.atrad.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170117111935.GC22965@marvin.atrad.com.au>
Sender: linux-kernel-owner@vger.kernel.org
To: Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Jonathan Woithe <jwoithe@just42.net>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Hi Michael
> 
> On Tue, Jan 17, 2017 at 12:07:33PM +0100, Micha?? K??pie?? wrote:
> > Here are two minor cleanups for acpi_fujitsu_notify() that I came up
> > with while preparing the sparse keymap migration.  They can be reviewed
> > and applied independently of the other series for fujitsu-laptop I
> > posted recently.
> 
> Ok.
> 
> > Jonathan, I decided to post this after re-reading the subjects of Alan
> > Jenkins' cleanup patches - I believe his work should not overlap with
> > this series.  In case it does, feel free to ignore or postpone this
> > series.  Also, there is no rush to apply these, they are just a base for
> > the upcoming sparse keymap patches.
> 
> I understand.  Thanks for posting these.  Like the earlier patch series they
> look fairly innoculous but I would like to run them up on my hardware just
> to be sure.  I do not have the hardware with me at linux.conf.au so this can
> only be done early next week.  Apologies for the delay.

Darren, Andy, please drop this patch series for now.  I will send a
rebased v2 after a long overdue patch series from Alan Jenkins gets
applied in a reworked form.

Thanks,

-- 
Best regards,
Michał Kępień
