From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: wmi: Do not mix pages and kmalloc
Date: Fri, 22 Jun 2018 16:27:30 -0700
Message-ID: <20180622232730.GA27466@fury>
References: <20180620213141.GA8957@beast>
 <20180620233736.GA3250@fury>
 <CAGXu5jL4V9sL7Ai1SVTNkg8OE70c6kLJBdqNtj9Z06MOb4zG0g@mail.gmail.com>
 <20180621001721.GB3250@fury>
 <3974cbadd027497982b5a52c765fb698@ausx13mpc120.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3974cbadd027497982b5a52c765fb698@ausx13mpc120.AMER.DELL.COM>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: keescook@chromium.org, linux-kernel@vger.kernel.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, mihai.dontu@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On Thu, Jun 21, 2018 at 01:24:34AM +0000, Mario.Limonciello@dell.com wrote:
> > -----Original Message-----
> > From: Darren Hart [mailto:dvhart@infradead.org]
> > Sent: Wednesday, June 20, 2018 7:17 PM
> > To: Kees Cook
> > Cc: LKML; Andy Shevchenko; Platform Driver; Mihai Donțu; Limonciello, Mario
> > Subject: Re: [PATCH] platform/x86: wmi: Do not mix pages and kmalloc
> > 
> > On Wed, Jun 20, 2018 at 04:43:14PM -0700, Kees Cook wrote:
> > > On Wed, Jun 20, 2018 at 4:37 PM, Darren Hart <dvhart@infradead.org> wrote:
> > > > On Wed, Jun 20, 2018 at 02:31:41PM -0700, Kees Cook wrote:
> > > >> The probe handler_data was being allocated with __get_free_pages()
> > > >> for no reason I could find. The error path was using kfree(). Since
> > > >
> > > > v4 of Mario's series used kmalloc:
> > > > https://patchwork.kernel.org/patch/9985827/
> > > >
> > > > This was changed in v10 to use __get_free_pages:
> > > > https://patchwork.kernel.org/patch/10018023/
> > > >
> > > > But... I'm not finding the discussion that led to this change.... Mario,
> > > > do you recall? Something about contiguous memory? We had a similar
> > > > discussion on an earlier series:
> > > >
> > > > https://patchwork.kernel.org/patch/9975277/
> > >
> > > FWIW, kmalloc gets you contiguous memory...
> > 
> > Yeah, I'm not finding a valid reason to use __get_free_pages over kmalloc in
> > this case. I'll give Mario a chance to respond in case I'm just missing
> > something, but otherwise will plan to apply this patch.
> 
> I think it was for contiguous memory, so if kmalloc is giving that I agree
> no need to keep __get_free_pages instead.
> 
> Acked-by: Mario Limonciello <Mario.limonciello@dell.com>

Confirmed, kmalloc in physically contiguous.

Queued up, and tagged for stable. Thanks everyone.

-- 
Darren Hart
VMware Open Source Technology Center
