From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v2 00/10] ICL support and other enhancements for PMC Core
Date: Wed, 13 Feb 2019 20:15:03 +0200
Message-ID: <CAHp75VefBpoE_PMuExh+92RvPFT4n+YWX5kyFwuWVr4a70RAvg@mail.gmail.com>
References: <20190213150810.32750-1-rajneesh.bhardwaj@linux.intel.com>
 <CAHp75VeTwjbdjAXPZfB5B7oataarjG0epV1SzokdYnCj8xcPhA@mail.gmail.com>
 <63bb8cc7-4feb-f69c-33be-ba5308c441d1@linux.intel.com> <CAHp75VdH8G+FfvznZePEG1F5A1Eyh8XF=a-MqpNooLWnBbP+gA@mail.gmail.com>
 <6db89a43-8c69-fc33-a777-61250433fcaa@linux.intel.com> <CAHp75VfF_fWtDG=jWJx_-ASCCjV2VGP4hh3HM8LOCEmv3q=K7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VfF_fWtDG=jWJx_-ASCCjV2VGP4hh3HM8LOCEmv3q=K7w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@linux.intel.com>
Cc: Platform Driver <platform-driver-x86@vger.kernel.org>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Feb 13, 2019 at 8:13 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Wed, Feb 13, 2019 at 8:02 PM Bhardwaj, Rajneesh
> <rajneesh.bhardwaj@linux.intel.com> wrote:
> > On 13-Feb-19 10:58 PM, Andy Shevchenko wrote:
> > > On Wed, Feb 13, 2019 at 5:50 PM Bhardwaj, Rajneesh
> > > <rajneesh.bhardwaj@linux.intel.com> wrote:
> > >> On 13-Feb-19 9:03 PM, Andy Shevchenko wrote:
>
> > > We don't do rebasing for published changes. Only in rear cases when
> > > otherwise would be worse.
> > > Darren didn't respond to my question what he thinks about this case,
> > > but at least it's not related to the code itself which, in my opinion,
> > > decreases a severity.
> >
> > Thanks Andy. So if i understand correctly, you are suggesting that i
> > should ignore those patches that made to "for-next" branch already?
>
> I suggest you to rebase your local branch against latest subsystem tip
> branch, resolve conflicts if any, test, and only after that send a new
> version.

To clarify: "subsystem tip branch" in our case means for-next. The
above is a generic process which would work with Linux kernel
development.

-- 
With Best Regards,
Andy Shevchenko
