From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2 4/4] toshiba_bluetooth: Remove BT enable code from
 *_notify function
Date: Thu, 26 Mar 2015 13:00:24 -0700
Message-ID: <20150326200024.GF19129@fury.dvhart.com>
References: <1427314757-18232-1-git-send-email-coproscefalo@gmail.com>
 <1427314757-18232-5-git-send-email-coproscefalo@gmail.com>
 <20150325212425.GE19129@fury.dvhart.com>
 <CAGdLNWFMPims1ySYe3eVaHzMJ4pek+dMVieYAM_YALkcq+TD=Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAGdLNWFMPims1ySYe3eVaHzMJ4pek+dMVieYAM_YALkcq+TD=Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Azael Avalos <coproscefalo@gmail.com>
Cc: "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Wed, Mar 25, 2015 at 04:18:19PM -0600, Azael Avalos wrote:
> > That suggests to me the checks for rfkill, powered, and plugged states should be
> > done in the _enable() function itself, rather than at all the call sites.
> >
> > So... would a better fix be to push these two additional tests into
> > toshiba_bluetooth_enable() before it calls AUSB and BTPO and then retain the
> > call the _enable() here?
> 
> Sure, I can apply these changes there.
> 
> What I wanted was to isolate what each call does as a preparation for
> upcoming patches where I will be purging toshiba_acpi from the BT
> RFKill code and add it to toshiba_bluetooth (where it belongs).

OK, I'll wait for v3 and pull it in. Thanks Azael.

-- 
Darren Hart
Intel Open Source Technology Center
