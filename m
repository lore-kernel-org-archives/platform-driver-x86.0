From: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed, 5 Dec 2018 14:15:41 +0530
Message-ID: <20181205084540.GA20250@raj-desk2.iind.intel.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com>
 <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com>
 <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
 <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
 <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com>
 <CAEExFWso=uBKj4geVTr2zWOd74V1p5EWq=7r6AATSPh63MQ=mg@mail.gmail.com>
 <CAHp75VcXO0YNd32PVfk+BE68+OUCy=THNi9buU2Wu=PUZhPt8g@mail.gmail.com>
 <CAEExFWtxJrGnoCq1_Nx3uMCW009Qe3LksG4e10s6nW3=p=UWiw@mail.gmail.com>
 <CAHp75Vd1Nzd+CDArk+26vwJvq=rULXxOHfq5rQEQjByJtWjH9w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAHp75Vd1Nzd+CDArk+26vwJvq=rULXxOHfq5rQEQjByJtWjH9w@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: tiny.windzz@gmail.com, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, David Box <david.e.box@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 05, 2018 at 10:42:21AM +0200, Andy Shevchenko wrote:
> On Wed, Dec 5, 2018 at 3:47 AM Frank Lee <tiny.windzz@gmail.com> wrote:
> > On Wed, Dec 5, 2018 at 1:39 AM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Dec 4, 2018 at 6:58 PM Frank Lee <tiny.windzz@gmail.com> wrote:
> 
> > > > $ git remote set-branches --add origin for-next
> > > > $ git br -vv
> > > > * for-next 651022382c7f [origin/for-next] Linux 4.20-rc1
> > >
> > > Here is the problem,
> > >
> > > For a few days at least we have
> > > 4ecd94b8e13b (HEAD -> for-next) platform/x86: dell-laptop: Mark
> > > expected switch fall-throughs
> 
> > Where can I find the correct git repository？
> 
> I think even old address still exists:
> http://git.infradead.org/users/dvhart/linux-platform-drivers-x86.git
> 
> > I haven't found the correct one for a long time,
> > which include the commit(4ecd94b8e13b ) you said.
> 
> And newest one is available via
> http://git.infradead.org/linux-platform-drivers-x86.git
> 
> http://git.infradead.org/linux-platform-drivers-x86.git/commit/4ecd94b8e13b014a28be48c94f751fb62f7c749e
> 
> Though it's already advanced to contain new portion of accepted
> patches (doesn't matter for you, because they don't touch file in
> question).

Hi Andy, i was thinking of having it split into two patches as it touches
two unrelated files. What is your opinion?

Functionality wise, it looks good to me.

> 
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko

-- 
Best Regards,
Rajneesh
