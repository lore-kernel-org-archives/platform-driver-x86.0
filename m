From: Frank Lee <tiny.windzz@gmail.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Wed, 5 Dec 2018 09:47:42 +0800
Message-ID: <CAEExFWtxJrGnoCq1_Nx3uMCW009Qe3LksG4e10s6nW3=p=UWiw@mail.gmail.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com> <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com>
 <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
 <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
 <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com>
 <CAEExFWso=uBKj4geVTr2zWOd74V1p5EWq=7r6AATSPh63MQ=mg@mail.gmail.com> <CAHp75VcXO0YNd32PVfk+BE68+OUCy=THNi9buU2Wu=PUZhPt8g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAHp75VcXO0YNd32PVfk+BE68+OUCy=THNi9buU2Wu=PUZhPt8g@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: rajneesh.bhardwaj@intel.com, vishwanath.somayaji@intel.com, dvhart@infradead.org, andy@infradead.org, David Box <david.e.box@linux.intel.com>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Dec 5, 2018 at 1:39 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Dec 4, 2018 at 6:58 PM Frank Lee <tiny.windzz@gmail.com> wrote:
>
> > $ git br -r
> >   origin/HEAD -> origin/master
> >   origin/fixes
> >   origin/for-next
> >   origin/master
> >   origin/review-andy
> > $ git remote set-branches --add origin for-next
> > $ git br -vv
> > * for-next 651022382c7f [origin/for-next] Linux 4.20-rc1
>
> Here is the problem,
>
> For a few days at least we have
> 4ecd94b8e13b (HEAD -> for-next) platform/x86: dell-laptop: Mark
> expected switch fall-throughs
>
> > $ git apply ../../0001-platform-x86-convert-to-DEFINE_SHOW_ATTRIBUTE.pa=
tch
> > $ git st
> > On branch for-next
> > Your branch is up to date with 'origin/for-next'.
> >
> > Changes not staged for commit:
> >   (use "git add <file>..." to update what will be committed)
> >   (use "git checkout -- <file>..." to discard changes in working direct=
ory)
> >
> >         modified:   drivers/platform/x86/intel_pmc_core.c
> >         modified:   drivers/platform/x86/intel_telemetry_debugfs.c
> >
> > no changes added to commit (use "git add" and/or "git commit -a")
>
> > Andy,I don't know why.
> > Is there a problem with my operation?
>
> Definitely.
Where can I find the correct git repository=EF=BC=9F
I haven't found the correct one for a long time,
which include the commit(4ecd94b8e13b ) you said.

MBR,
Yangtao
>
> --
> With Best Regards,
> Andy Shevchenko
