From: Daniel Drake <dsd@laptop.org>
Subject: Re: [PATCH] OLPC XO-1.5 ebook switch driver
Date: Tue, 11 Jan 2011 14:55:55 +0000
Message-ID: <1294757755.2529.3.camel@polyethylene>
References: <20101229185829.78A669D401D@zog.reactivated.net>
	 <20110107013450.GA28842@core.coreip.homeip.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-PLHmOJlcefSSTWurm2bl"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-ww0-f44.google.com ([74.125.82.44]:37405 "EHLO
	mail-ww0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753799Ab1AKO4F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 11 Jan 2011 09:56:05 -0500
Received: by wwa36 with SMTP id 36so1848623wwa.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2011 06:56:03 -0800 (PST)
In-Reply-To: <20110107013450.GA28842@core.coreip.homeip.net>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: mjg@redhat.com, platform-driver-x86@vger.kernel.org, pgf@laptop.org


--=-PLHmOJlcefSSTWurm2bl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-01-06 at 17:34 -0800, Dmitry Torokhov wrote:
> No, instead of adding yet another kernel attribute just use ioctl to get
> current switch state. Or write a general purpose utility to query
> switch/key state and contribute it to consoletools project - many people
> have asked fr it ;)

Thanks for the review.

Did you mean consoletools as in http://lct.sourceforge.net/ ?
It looks rather dead.

Perhaps util-linux-ng would be a more appropriate target?

I'm attaching the general purpose utility for your comments.

Thanks,
Daniel


--=-PLHmOJlcefSSTWurm2bl
Content-Description: 
Content-Disposition: inline; filename="evstate.c"
Content-Type: text/x-csrc; name="evstate.c"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

/*
 * evstate: query evdev key/led/sw/snd state
 * Returns exit code 1 if the state bit is set (key pressed, LED on, etc.),
 * and 0 if the state bit is unset.
 *
 * Copyright (C) 2011 One Laptop per Child
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#define _GNU_SOURCE

#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>
#include <sys/types.h>
#include <unistd.h>

#include <linux/input.h>

#define BITS_PER_LONG (sizeof(long) * 8)

static int test_bit(unsigned int nr, void *addr)
{
	return ((1UL << (nr % BITS_PER_LONG)) &
		(((unsigned long *) addr)[nr / BITS_PER_LONG])) != 0;
}

static void __attribute__((noreturn)) usage(void)
{
	printf("Usage:\n"
	       "  %s <device> <mode> <key>\n"
		   "Valid modes: key, led, snd, sw\n",
	       program_invocation_short_name);
	exit(2);
}

static const struct mode {
	const char *name;
	int max;
	int rq;
} requests[] = {
	{ "key", KEY_MAX, EVIOCGKEY(KEY_MAX) },
	{ "led", LED_MAX, EVIOCGLED(LED_MAX) },
	{ "snd", SND_MAX, EVIOCGSND(SND_MAX) },
	{ "sw",  SW_MAX, EVIOCGSW(SW_MAX) },
};

static const struct mode *find_mode(const char *name)
{
	int i;
	for (i = 0; i < sizeof(requests) / sizeof(*requests); i++) {
		const struct mode *mode = &requests[i];
		if (strcmp(mode->name, name) == 0)
			return mode;
	}
	return NULL;
}

static int query_state(const char *device, long int keyno,
		       const struct mode *mode)
{
	uint8_t state[(mode->max / 8) + 1];
	int fd;
	int r;

	if (keyno < 0 || keyno > mode->max) {
		fprintf(stderr, "Unrecognised key %d\n", keyno);
		exit(3);
	}

	fd = open(device, O_RDONLY);
	if (fd == -1) {
		perror("open");
		exit(3);
	}

	memset(state, 0, sizeof(state));
	r = ioctl(fd, mode->rq, state);
	close(fd);

	if (r == -1) {
		perror("ioctl");
		exit(3);
	}

	return test_bit(keyno, state);
}

int main(int argc, char **argv)
{
	const struct mode *mode;
	long int keyno;

	if (argc != 4)
		usage();

	mode = find_mode(argv[2]);
	if (!mode) {
		fprintf(stderr, "Unrecognised mode.\n");
		usage();
	}

	keyno = strtol(argv[3], NULL, 10);
	return query_state(argv[1], keyno, mode);
}


--=-PLHmOJlcefSSTWurm2bl--
