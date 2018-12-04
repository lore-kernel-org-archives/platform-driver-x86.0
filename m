From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH] platform/x86: convert to DEFINE_SHOW_ATTRIBUTE
Date: Tue, 4 Dec 2018 19:39:37 +0200
Message-ID: <CAHp75VcXO0YNd32PVfk+BE68+OUCy=THNi9buU2Wu=PUZhPt8g@mail.gmail.com>
References: <20181201155229.8532-1-tiny.windzz@gmail.com> <CAHp75VdEbr9YfaCgHXNqScZC-KMobF2fU8rZb29nhZPBJvm2gg@mail.gmail.com>
 <CAEExFWvRFrS-ZTSkrS5Npe7g-rxtxfCfk+AyTz00Lx4oAWhQ_g@mail.gmail.com>
 <CAHp75VcSVEakAK4MeoG8zA7MaCWNoL2fOr48iFmxTsjbBpa5XA@mail.gmail.com>
 <CAEExFWtE7Yi8D+Dr=J7B3zqBRet0AX=ABHnUrJkZ2LO3aHdNeg@mail.gmail.com>
 <CAHp75Vc7Xfqnid9WLvQMPPWcFnRG0T4ZoHweA6Q-1ypWn29J2Q@mail.gmail.com> <CAEExFWso=uBKj4geVTr2zWOd74V1p5EWq=7r6AATSPh63MQ=mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAEExFWso=uBKj4geVTr2zWOd74V1p5EWq=7r6AATSPh63MQ=mg@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: tiny.windzz@gmail.com
Cc: Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>, Vishwanath Somayaji <vishwanath.somayaji@intel.com>, Darren Hart <dvhart@infradead.org>, Andy Shevchenko <andy@infradead.org>, David Box <david.e.box@linux.intel.com>, Platform Driver <platform-driver-x86@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Tue, Dec 4, 2018 at 6:58 PM Frank Lee <tiny.windzz@gmail.com> wrote:

> $ git br -r
>   origin/HEAD -> origin/master
>   origin/fixes
>   origin/for-next
>   origin/master
>   origin/review-andy
> $ git remote set-branches --add origin for-next
> $ git br -vv
> * for-next 651022382c7f [origin/for-next] Linux 4.20-rc1

Here is the problem,

For a few days at least we have
4ecd94b8e13b (HEAD -> for-next) platform/x86: dell-laptop: Mark
expected switch fall-throughs

> $ git apply ../../0001-platform-x86-convert-to-DEFINE_SHOW_ATTRIBUTE.patch
> $ git st
> On branch for-next
> Your branch is up to date with 'origin/for-next'.
>
> Changes not staged for commit:
>   (use "git add <file>..." to update what will be committed)
>   (use "git checkout -- <file>..." to discard changes in working directory)
>
>         modified:   drivers/platform/x86/intel_pmc_core.c
>         modified:   drivers/platform/x86/intel_telemetry_debugfs.c
>
> no changes added to commit (use "git add" and/or "git commit -a")

> Andy,I don't know why.
> Is there a problem with my operation?

Definitely.

-- 
With Best Regards,
Andy Shevchenko
