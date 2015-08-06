From: Joe Perches <joe@perches.com>
Subject: Re: [PATCH] surface pro 3: Add support driver for Surface Pro 3
 buttons
Date: Thu, 06 Aug 2015 07:54:37 -0700
Message-ID: <1438872877.2679.56.camel@perches.com>
References: <1438838165-3791-1-git-send-email-yu.c.chen@intel.com>
	 <1438839022.2679.49.camel@perches.com> <1438860256.2127.37.camel@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438860256.2127.37.camel@localhost>
Sender: linux-kernel-owner@vger.kernel.org
To: "Chen, Yu C" <yu.c.chen@intel.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Zhang, Rui" <rui.zhang@intel.com>, "jslaby@suse.com" <jslaby@suse.com>, "dvhart@infradead.org" <dvhart@infradead.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>, "Westerberg, Mika" <mika.westerberg@intel.com>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "mchehab@osg.samsung.com" <mchehab@osg.samsung.com>, "arnd@arndb.de" <arnd@arndb.de>
List-Id: platform-driver-x86.vger.kernel.org

On Thu, 2015-08-06 at 11:20 +0000, Chen, Yu C wrote:
> On Wed, 2015-08-05 at 22:30 -0700, Joe Perches wrote:
[]
> > > +	case SURFACE_BUTTON_NOTIFY_PRESS_HOME:
> > > +		pressed = true;
> > > +	case SURFACE_BUTTON_NOTIFY_RELEASE_HOME:
> > > +		key_code = KEY_LEFTMETA;
> > > +		break;
> > 
> > It may be better to add a comment about the style or
> > maybe add a macro like
> > 
> > #define HANDLE_SURFACE_BUTTON_NOTIFY(type, code)	\
> > 	case SURFACE_BUTTON_NOTIFY_PRESS_##type:	\
> > 		pressed = true;	/* and fall-through */	\
> > 	case SURFACE_BUTTON_NOTIFY_RELEASE_##type:	\
> > 		key_code = code;			\
> > 		break;
> > 
> WRT macro HANDLE_SURFACE_BUTTON_NOTIFY, the checkpatch.pl
> complains that multi lines of codes should be wrapped in 'do
> while'state, but doing like this might lead to incorrect semantic.

checkpatch is a brainless tool that should be ignored
whenever you want.

> Is it ok to keep these codes and add comments like:

Up to you.  It'd OK to do nothing too.
