From: =?UTF-8?B?S2VuZy1Zw7wgTGlu?= <keng-yu.lin@canonical.com>
Subject: Re: [PATCH v4] dell-laptop: Add debugfs support
Date: Tue, 28 Sep 2010 10:43:44 +0800
Message-ID: <AANLkTi=buauo9M=nLnZhEXm-do=Vt1mPwhq3oPFH9fQ_@mail.gmail.com>
References: <1284702459-31646-1-git-send-email-keng-yu.lin@canonical.com>
 <1285325323-4528-1-git-send-email-keng-yu.lin@canonical.com> <20100927140028.GB856@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20100927140028.GB856@srcf.ucam.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Matthew Garrett <mjg59@srcf.ucam.org>
Cc: len.brown@intel.com, alan-jenkins@tuffmail.co.uk, superm1@ubuntu.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Sep 27, 2010 at 10:00 PM, Matthew Garrett <mjg59@srcf.ucam.org> wrote:
> What's the difference between this version and v3?
>
> --
> Matthew Garrett | mjg59@srcf.ucam.org
>

Hi Mathew:
  V3 does not print the correct bit of hwswitch_state. I just found
that V4 messed up by the operator precedence; will send a new fix.

  Regards,
-kengyu
